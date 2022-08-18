#!/bin/sh

dir="$HOME/Docummentos/prog"
selected=ls dir | fzf

z $selected
