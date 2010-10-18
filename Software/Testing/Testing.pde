
//button 1 is around 150
//button 2 is around 411
//both buttons is 0 always
#define button 4

//right is 653
//left is 163
#define sliderH 2

//up is 671
//down is 140
#define sliderV 1

#define whiteLED 5

//analog 3
#define buzzer 17


void setup(){
  Serial.begin(9600);
  
 }

void loop(){
  //button
  Serial.print("Button: ");
  Serial.println(analogRead(button));
  
  //slider
  Serial.print("SliderH: ");
  Serial.println(analogRead(sliderH));
  Serial.print("SliderV: ");
  Serial.println(analogRead(sliderV));
  
  delay(2000);
  
  
  
}
  
