#!/bin/bash
xterm -hold -e 'echo "e = encrypt d = decrypt:" 
read e d 
read -p "paste full path to file:" file
ccat -$e $file
ccat -$d $file'
