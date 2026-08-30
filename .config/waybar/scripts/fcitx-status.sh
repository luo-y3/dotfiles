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

last=""
while true; do
  cur=$(fcitx5-remote -n)
  if [ "$cur" != "$last" ]; then
    print_lang
    last="$cur"
  fi
  sleep 0.3
done
