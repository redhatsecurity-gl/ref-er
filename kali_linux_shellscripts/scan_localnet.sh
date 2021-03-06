#!/bin/bash
xterm -hold -e "watch arp-scan --localnet" &
xterm -hold -e "netdiscover -p -r 192.168.2.1/24" &
xterm -hold -e "watch netstat -nutlp" &
xterm -hold -e "iw dev wlan0 scan | grep '^BSS\|SSID\|WSP\|Authentication\|WPS\|WPA'" &
