#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme="style-1"

CALENDAR_DATA=$(LC_TIME=zh_CN.UTF-8 cal -s)

CALENDAR_DATA=$(echo "$CALENDAR_DATA" | sed 's/日 一 二 三 四 五 六/ 日  一  二  三  四  五  六/')

echo "$CALENDAR_DATA" | rofi -theme "${dir}/${theme}.rasi" -dmenu -p " 📅 ปฏิทิน " -lines 8 -width 25
