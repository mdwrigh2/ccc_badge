#include <glcd_Config.h>
#include <glcd.h>
#include "fonts/fixednums15X31.h"
#include "fonts/SystemFont5x7.h"

void setup(){
    GLCD.Init();
    GLCD.SelectFont(System5x7);
    GLCD.ClearScreen();
    
    firstBoot();
}

void loop(){
    //wait for input here
    //possibly the menu dialog waits here for input, I don't know!
}

void firstBoot(){
   printSplash();
   name = keyboardDialog("Enter Name:");
   major = chooseMajor();
   character = chooseCharacter();
   team = keyboardDialog("Enter Team:");
   
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




