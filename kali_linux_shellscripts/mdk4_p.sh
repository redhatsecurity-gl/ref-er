#!/bin/bash
bssid=$(zenity --entry --text="ap mac-address")
ssid=$(zenity --entry --text="target ssid?")
xterm -hold -e "mdk4 wlan0mon p -t $bssid -e $ssid"
