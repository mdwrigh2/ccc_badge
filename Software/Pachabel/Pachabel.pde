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

// notes in the melody:
int melody[] = {
  FS5, E5, D5, CS5, 
  B4, A4, B4, CS5,
  D5, CS5, B4, A4,
  G4, FS4, G4, E4,
  
  D4, FS4, A5, G4, FS4, D4, FS4, E4,
  D4, B3, D4, A4, G4, B4, A4, G4,
  FS4, D4, E4, CS5, D5, FS5, A5, A4,
  B4, G4, A4, FS4, D4, D5, D5, CS5,
  
  D5, CS5, D5, D4, CS4, A4, E4, FS4, D4, D5, CS5, B4, CS5, FS5, A5, B6,
  G5, FS5, E5, G5, FS5, E5, D5, CS5, B4, A4, G4, FS4, E4, G4, FS4, E4,
  D4, E4, FS4, G4, A4, E4, A4, G4, FS4, B4, A4, G4, A4, G4, FS4, E4,
  D4, B3, B4, CS5, D5, CS5, B4, A4, G4, FS4, E4, B4, A4, B4, A4, G4,
  FS4, FS5, E5, 0, D5, FS5,
  B5, A5, B5, CS6,
  D6, D5, CS5, 0, B4, D5,
  D5, D5, D5, CS6, E5, A5,
  A5, FS5, G5, A5, FS5, G5, A5, A4, B4, CS5, D5, E5, FS5, G5, FS5, D5, E5, FS5, FS4, G4, A4, B4, A4, G4, A4, FS4, G4, A4,
  G4, B4, A4, G4, FS4, E4, FS4, E4, D4, E4, FS4, G4, A4, B4, G4, B4, A4, B4, CS4, E4, A4, B4, CS5, D5, E5, FS6, G6, A6
  };

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 4, 4, 4, 
  4, 4, 4, 4,
  4, 4, 4, 4,
  4, 4, 4, 4,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  8, 8, 8, 8, 8, 8, 8, 8,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16,
  8, 8, 4, 8, 8, 4,
  4, 4, 4, 4,
  8, 8, 4, 8, 8, 4,
  3, 8, 8, 8, 8, 8,
  16, 32, 32, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 32, 32, 16, 32, 32, 32, 32, 32 ,32 ,32 ,32 ,32 ,32,
  16, 32, 32, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 32, 32, 16, 32, 32, 32, 32, 32 ,32 ,32 ,32 ,32 ,32
  };

void setup() {
  // iterate over the notes of the melody:
  for (int thisNote = 130; thisNote < sizeof(noteDurations)/sizeof(int); thisNote++) {

    // to calculate the note duration, take one second 
    // divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 2000/noteDurations[thisNote];
    tone(17, melody[thisNote],noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
  }
}

void loop() {
  // no need to repeat the melody.
}




