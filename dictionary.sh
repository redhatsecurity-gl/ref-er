#!/bin/bash
word=$(zenity --entry --text="word to lookup? info will be saved on desktop")
curl dict://dict.org/d:$word > /root/Desktop/$word.txt
