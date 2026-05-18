#!/usr/bin/env bash

print_lang() {
  local name
  name=$(fcitx5-remote -n)

  case "$name" in
  keyboard-us)
    echo "英"
    ;;
  keyboard-th)
    echo "泰"
    ;;
  pinyin)
    echo "中"
    ;;
  mozc)
    echo "日"
    ;;
  *)
    echo "$name"
    ;;
  esac
}

print_lang

fcitx5-remote -m | while read -r _; do
  print_lang
done
