#ifndef GAME
#define GAME

//State variables Eww
byte firstBoot;
byte state;

//States
#define BOOT 0
#define KEYBOARD 2
#define MAJOR 4
#define CHARACTER 6
#define MENU 8
#define ENEMIES 10
#define STATS 12
#define HELP 14
#define ABOUT 16

//major and character codes
byte major;
byte character;
char *name;
char *team;

//things that happen in the first boot
void firstBootSetup();
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




