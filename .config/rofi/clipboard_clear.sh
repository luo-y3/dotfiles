#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme='style-1'

choice=$(printf "No\nYes" | rofi \
  -dmenu \
  -i \
  -p "Clear Clipboard History?" \
  -theme ${dir}/${theme}.rasi)

if [ "$choice" = "Yes" ]; then
  cliphist wipe
  notify-send "Clipboard" "History cleared"
fi
