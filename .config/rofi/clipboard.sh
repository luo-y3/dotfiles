#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='style-1'

cliphist list | rofi \
  -dmenu \
  -i \
  -p "Clipboard" \
  -theme ${dir}/${theme}.rasi | cliphist decode | wl-copy
