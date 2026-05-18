#!/usr/bin/env bash

dir="$HOME/.config/rofi"
theme="style-1"
ROFI_CMD="rofi -theme ${dir}/${theme}.rasi"

WIFI_STATUS=$(nmcli r wifi)

if [ "$WIFI_STATUS" = "enabled" ]; then
  TOGGLE_TEXT="󰖪  Turn Wi-Fi OFF"
else
  TOGGLE_TEXT="󰖩  Turn Wi-Fi ON"
fi

CHOSEN=$(echo -e "$TOGGLE_TEXT\n󰖩  Connect to Wi-Fi\n󰈀  Check Connection" | $ROFI_CMD -dmenu -p " Network Menu " -lines 3)

case "$CHOSEN" in
*"Turn Wi-Fi ON"*)
  nmcli r wifi on
  ;;
*"Turn Wi-Fi OFF"*)
  nmcli r wifi off
  ;;
*"Connect to Wi-Fi"*)
  echo "Scanning..." | $ROFI_CMD -dmenu -p " Scanning... " -lines 1 &
  SCAN_PID=$!

  WIFI_LIST=$(nmcli --fields SSID,SECURITY,BARS device wifi list | grep -v '^--' | sed 's/^SSID//' | awk 'NF')

  kill $SCAN_PID 2>/dev/null

  SELECT_WIFI=$(echo "$WIFI_LIST" | $ROFI_CMD -dmenu -p " Select Wi-Fi " -lines 10)

  if [ -n "$SELECT_WIFI" ]; then
    SSID=$(echo "$SELECT_WIFI" | awk '{print $1}')

    if echo "$SELECT_WIFI" | grep -qE "WPA|WEP"; then
      PASSWORD=$($ROFI_CMD -dmenu -p " Password for $SSID: " -password -lines 1)
      if [ -n "$PASSWORD" ]; then
        nmcli device wifi connect "$SSID" password "$PASSWORD"
      fi
    else
      nmcli device wifi connect "$SSID"
    fi
  fi
  ;;
*"Check Connection"*)
  STATUS_INFO=$(nmcli device status)
  echo "$STATUS_INFO" | $ROFI_CMD -dmenu -p " Connection Status " -lines 5
  ;;
esac
