#!/bin/bash
cmdtopdf=$(zenity --entry --text="what manpage you want to make into pdf?")
man -t $cmdtopdf | ps2pdf - $cmdtopdf.pdf
