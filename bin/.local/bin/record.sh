#!/usr/bin/bash
echo -n "output file: "
read OUT
    
ffmpeg -f x11grab -s 1366x768 -i :0.0 -f alsa -i default "$HOME/Vídeos/$OUT.mkv"
