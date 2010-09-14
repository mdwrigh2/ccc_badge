/*
 * GLCDexample
 *
 * Basic test code for the Arduino GLCD library.
 * This code exercises a range of graphic functions supported
 * by the library and provides examples of its use.
 * It also gives an indication of performance, showing the
 * number of frames drawn per second.  
 */

#include <glcd.h>

#include "fonts/allFonts.h"         // system and arial14 fonts are used
#include "bitmaps/allBitmaps.h"       // all images in the bitmap dir 

/*** INPUTS ***/
int buttonPin = 3;  // analog pin 3
int sliderPin1 = 4; // analog pin 4
int sliderPin2 = 5; // analog pin 5

/*** SOUND ***/
int soundPin = 2; // digital pin 2
unsigned long nextSound;   // last time we heard noise + soundDuration
int soundDelay = 750; // milliseconds
int soundDuration = 250; // how long to hold the note

/*** LED ***/
int blinkPin = 3; // digital pin 3
unsigned long nextBlink;
int blinkDelay = 330; // milliseconds
int blinkState;

/*** WIRELESS ***/
unsigned long nextWireless;
int wirelessDelay = 2600;


void setup()
{
  pinMode(0, OUTPUT); // tx
  pinMode(1, INPUT); //rx
  Serial.begin(9600);
  GLCD.Init();   // initialise the library, non inverted writes pixels onto a clear screen
  GLCD.SelectFont(System5x7);
  GLCD.SetFontColor(BLACK); 
  GLCD.ClearScreen(); 
  GLCD.CursorTo(0,0); 
  GLCD.print("Hello, world!\n");
  delay(1000);
  GLCD.ClearScreen(); 
  pinMode(soundPin,OUTPUT);
  pinMode(blinkPin,OUTPUT);
  nextSound = millis() + soundDelay; // time to next 'noise'
  nextBlink = millis() + blinkDelay; // time to next 'blink'
  nextWireless = millis() + wirelessDelay; // there is a patter
}

void  loop()
{  
  int buttonRead;
  int buttonDecode;
  int sliderRead1;
  int sliderRead2;
  GLCD.ClearScreen();
  
  /*** INPUT ***/
  GLCD.CursorTo(0,0);
  buttonRead = analogRead(buttonPin);
  buttonDecode = decodeButtons(buttonRead);
  GLCD.Printf("Button:%04x %d",buttonDecode,buttonRead);
  GLCD.CursorTo(0,1);
  sliderRead1 = analogRead(sliderPin1);
  GLCD.print("Slider1:");
  GLCD.print(sliderRead1);
  GLCD.CursorTo(0,2);
  sliderRead2 = analogRead(sliderPin2);
  GLCD.print("Slider2:");
  GLCD.print(sliderRead2);
  
  /*** BLINK ***/
  GLCD.CursorTo(0,4);
  GLCD.print("Blink:");
  if (blinkState == HIGH) {
    GLCD.print("On ");
  } else {
    GLCD.print("Off");
  }
  if (millis() >= nextBlink) { // switch it
    digitalWrite(blinkPin, blinkState == LOW ? HIGH : LOW);
    blinkState = blinkState == LOW ? HIGH : LOW;
    nextBlink = millis() + blinkDelay;
  }
  
  /*** SOUND ***/
  GLCD.CursorTo(0,3);
  GLCD.print("Sound:");
  if (millis() >= nextSound) {
    GLCD.print("On");
    noise(soundDuration);  // takes up a bit of time
    nextSound = millis() + soundDelay;
  } else {
    GLCD.print("Off");
  }
  
  /*** WIRELESS ***/
  if (millis() >= nextWireless) {
    int i;
    GLCD.CursorTo(0,5);
    GLCD.print("Wireless...");
    /* Check */
    Serial.flush();
    Serial.write("+++"); // delay is important
    while((i = Serial.read()) <= -1); // wait for input
    do { // get input
      GLCD.print(i)
      ; // should print 'OK'
    } while((i = Serial.read()) > -1);
    delay(100);
    /* Display name */
    GLCD.CursorTo(0,6);
    GLCD.print("Name:");
    Serial.flush();
    Serial.write("ATNI\n"); // give me my name
    while((i = Serial.read()) <= -1); // wait for input
    while((i = Serial.read()) > -1) { // get input
      GLCD.print(i); // should display my name
    }
    delay(100);
    /* Association Indication */
    GLCD.CursorTo(0,7);
    GLCD.print("Assoc:");
    Serial.flush();
    Serial.write("ATID\n"); // give me my net status
    while((i = Serial.read()) <= -1); // wait for input
    while((i = Serial.read()) > -1) { // get input
      GLCD.print(i); // should display my name
    }
   nextWireless = millis() + wirelessDelay;
   delay(300); // so we can read it
  }
    
  delay(20); // tiny artificial delay so we dont drive the display too fast
}

/* make noise for the given duration in milliseconds */
void noise(int duration) {
  unsigned long start = millis();
  
  while( millis() - start < duration)
  {
    int period = random(8,25); 
    digitalWrite(soundPin, HIGH);
    delay(period);
    digitalWrite(soundPin, LOW);      
    delay(period);
  }
}

/* Calculate Buttons from analog value */
#define BUTTON1 (1<<12)
#define BUTTON2 (1<<8)
#define BUTTON3 (1<<4)
#define BUTTON4 (1)
/* To get these 'stop' values, i measured each button combo (printed it to LCD)
   Then took the average between each consecutive pair, and had that as the boundary.
   The presses tend not to vary more than +/- 5, so this is good enough */
int decodeButtons(int aread) {
         if (aread > 650) {
    return 0;
  } else if (aread > 634) {
    return BUTTON4;
  } else if (aread > 617) {
    return BUTTON3;
  } else if (aread > 596) {
    return BUTTON3 | BUTTON4;
  } else if (aread > 573) {
    return BUTTON2;
  } else if (aread > 551) {
    return BUTTON2 | BUTTON4;
  } else if (aread > 525) {
    return BUTTON2 | BUTTON3;
  } else if (aread > 498) {
    return BUTTON2 | BUTTON3 | BUTTON4;
  } else if (aread > 449) {
    return BUTTON1;
  } else if (aread > 395) {
    return BUTTON1 | BUTTON4;
  } else if (aread > 350) {
    return BUTTON1 | BUTTON3;
  } else if (aread > 291) {
    return BUTTON1 | BUTTON3 | BUTTON4;
  } else if (aread > 219) {
    return BUTTON1 | BUTTON2;
  } else if (aread > 145) {
    return BUTTON1 | BUTTON2 | BUTTON4; 
  } else if (aread > 54) {
    return BUTTON1 | BUTTON2 | BUTTON3; 
  } else {
    return BUTTON1 | BUTTON2 | BUTTON3 | BUTTON4;
  }
}
