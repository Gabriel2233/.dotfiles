#!/bin/sh

dir="$HOME/Documentos/prog"
selected=$(find $dir -type f | fzf)
zathura $selected
