#!/bin/bash
cmd=$(zenity --entry --text="what cmd do you want to loop?")
xterm -hold -e "for i in {1..100}; do $cmd; done"
