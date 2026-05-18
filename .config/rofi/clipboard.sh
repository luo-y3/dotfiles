#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='style-1'

cliphist list | rofi \
  -dmenu \
  -display-column 2 \
  -p "Clipboard" \
  -theme ${dir}/${theme}.rasi | cliphist decode | wl-copy
