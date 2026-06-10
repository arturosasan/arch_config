#!/bin/bash

STATUS=$(warp-cli status 2>/dev/null || echo "Error")
MODE=$(warp-cli mode 2>/dev/null || echo "unknown")

OPTIONS=()
if [[ "$STATUS" == *"Connected"* ]]; then
  OPTIONS+=("Disconnect")
  if [[ "$MODE" == "doh" ]]; then
    OPTIONS+=("Mode: WARP (Full)")
  else
    OPTIONS+=("Mode: DNS-only")
  fi
else
  OPTIONS+=("Connect")
  [[ "$MODE" != "doh" ]] && OPTIONS+=("Mode: DNS-only")
  [[ "$MODE" == "doh" ]] && OPTIONS+=("Mode: WARP (Full)")
fi
OPTIONS+=("Exit")

CHOICE=$(printf '%s\n' "${OPTIONS[@]}" | rofi -dmenu -p "WARP")

case "$CHOICE" in
"Connect") warp-cli connect ;;
"Disconnect") warp-cli disconnect ;;
"Mode: DNS-only") warp-cli mode doh ;;
"Mode: WARP (Full)") warp-cli mode warp ;;
esac
