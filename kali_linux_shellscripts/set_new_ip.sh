#!/bin/bash
newip=$(zenity --entry --text="pick 2 new didgets for new ip")
echo $newip | ifconfig wlan0 192.168.1.$newip/24
