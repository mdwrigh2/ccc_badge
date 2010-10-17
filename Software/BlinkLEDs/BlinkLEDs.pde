/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */

void setup() {                
  // initialize the digital pin as an output:
  pinMode(A5, OUTPUT);  // LED on board 
}

void loop() {
  digitalWrite(A5, HIGH);   // set the LED on
  delay(1000);              // wait for a second
  digitalWrite(A5, LOW);    // set the LED off
  delay(1000);              // wait for a second
}
