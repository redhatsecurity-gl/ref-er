#!/bin/bash
xterm -hold -e "apt update; apt dist-upgrade -y; apt autoremove -y; apt autoclean; apt clean; free"
