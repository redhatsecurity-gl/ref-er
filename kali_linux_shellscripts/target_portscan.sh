#!/bin/bash
IP=$(zenity --entry --text="target ip")
xterm -hold -e "masscan -p1-65535,U:1-65535 $IP --rate=1000 -e wlan0"
