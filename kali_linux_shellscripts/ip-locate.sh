#!/bin/bash
ip=$(zenity --entry --text="enter ip or host")
xterm -hold -e "/root/Desktop/MODUELS/iplocater.pl $ip"
