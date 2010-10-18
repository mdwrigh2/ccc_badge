#include <glcd_Config.h>
#include <glcd.h>
#include "fonts/fixednums15X31.h"
#include "fonts/SystemFont5x7.h"

int ButtonA;
#define ButtonAPin;

int ButtonB;
#define ButtonBPin;

int joystickH;
#define joystickHPin;
int joystickV;
#define joystickVPin;

#define buzzerPin 

void setup(){
    GLCD.Init();
    GLCD.SelectFont(System5x7);
    GLCD.ClearScreen();
    firstBootSetup();
    printSplash();

}

void loop(){
    //set the current state of buttons we may want some to pre-empt others
    ButtonA = digitalRead(ButtonAPin);
    ButtonB = digitalRead(ButtonBPin);
    //we're going to want a way to figure out up-down left-right from this info
    joystickH = analogRead(joystickHPin);
    joystickV = analogRead(joystickVPin);
    
    if(firstBoot){
        switch(state){
          case KEYBOARD:
             keyboardDialog();
          case CHARACTER:
             
          case MAJOR:
          default:
            //EVERYBODY DIES
        }
    else{        
      switch(state){
        case MENU:
        case ENEMIES:
        case STATS:
        case HELP:
        case ABOUT:
        default:
          //hope we don't get here
      }
    }
       
    //wait for input here
    //possibly the menu dialog waits here for input, I don't know!
    }
}

void firstBootSetup(){
   printSplash();
   
   
}

void printSplash(){
    gText textTop = gText(textAreaTOP);
    textTop.SelectFont(fixednums15x31);
    
    gText textBottom = gText(textAreaBOTTOM);
    textBottom.SelectFont(System5x7);
    
    //not sure how this will look yet
    GLCD.DrawRoundRect(0,0, GLCD.Width, GLCD.Height, 5);
    textTop.printf("Anomalous Pomegranate");
    textBottom.printf("Carson Holgate\nAlex Ray\nMichael Wright");
    delay(1500); //wait however long
}

char *keyboardDialog(char *prompt){
    /**
     needs to initialize prompt and keyboard
     wait for button input to move to different keys by inverting black and white
     and then store values 
    **/
}




