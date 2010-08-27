#ifndef GAME
#define GAME

//major and character codes
byte major;
byte character;
char *name;
char *team;

//things that happen in the first boot
void firstBoot();
void printSplash();
char *keyboardDialog(char *prompt); //name
byte chooseMajor();
byte chooseCharacter();
//keyboardDialog gets called again for team name

//menu functions
void mainMenu(); //could possibly just be the main loop
void enemies();
void stats();
void help();
void about();

//fight functions




