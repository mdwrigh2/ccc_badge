Software - this directory contains relevant software for this project.

X-CTU.exe - this is for programming the XBee (change coordinator/router or
    other settings)
XBee-Firmware.zip - firmware update for X-CTU
X-CTU_wine_setup.pdf - document showing how to setup X-CTU with Wine

Note: we are using the 1047/1247 versions of the ZNET 2.5 * AT firmware

Note: the .exe is a bit big for github, so i just have the command to pull it here, and added it to .gitignore
>$ wget http://ftp1.digi.com/support/utilities/40002637_c.exe

GLCD_V3_beta.zip - archive containing the Graphical LCD library for Arduino
    extract it to: arduino-0018/libraries/
    it should unpack in a 'glcd' folder there

Programming_Instructions.txt - tells you how to program the various devices

ln -s /dev/ttyUSB0 ~/.winebalahasldkfhjdsagh
