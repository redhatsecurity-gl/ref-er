#!/bin/bash
fakeap=$(zenity --entry --text="create a fake ap name")
xterm -hold -e "mdk4 wlan0mon b -n "$fakeap""
