#!/bin/bash
airmon-ng check kill
airmon-ng start wlan0
xterm -hold -e "airodump-ng --manufacturer --wps wlan0mon"
