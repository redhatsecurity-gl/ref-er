#!/bin/bash
term -hold -e '"read -p "nmap script searcher pattern/word?:" word; ls /usr/share/nmap/scripts/* | grep $word"'
