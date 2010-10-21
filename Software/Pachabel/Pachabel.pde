/*
  Melody
 
 Plays a melody 
 
 circuit:
 * 8-ohm speaker on digital pin 8
 
 created 21 Jan 2010
 by Tom Igoe 
 
 http://arduino.cc/en/Tutorial/Tone
 
 */
 #include "pitches.h"
 #include <avr/pgmspace.h>


void setup() {
  //Serial.begin(9600);
  // iterate over the notes of the melody:
  long int size = sizeof(noteDurations)/sizeof(int);
  //Serial.print("HERE");
  
  //Serial.println(size);
  
  
  for (int thisNote = 0; thisNote < size; thisNote++) {    
    
    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 2000/(pgm_read_word_near(noteDurations+thisNote));
    tone(17, pgm_read_word_near(melody+thisNote),noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
  }
}

void loop() {
  // no need to repeat the melody.
}




