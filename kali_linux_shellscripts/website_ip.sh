#!/bin/bash
weburl=$(zenity --entry --text="web url to scan")
xterm -hold -e "echo $(wget -qO - $weburl)"
