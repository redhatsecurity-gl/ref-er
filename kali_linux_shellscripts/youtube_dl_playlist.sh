#!/bin/bash
xterm -hold -e 'echo "enter youtube playlist url"; read playlist; yt-dlp -f "ba" -x --audio-format mp3 --yes-playlist $playlist'
