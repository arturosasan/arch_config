#!/bin/bash
CONNECTION="VPN UPV"
STATUS=$(nmcli connection show --active | grep "$CONNECTION" &> /dev/null && echo "up" || echo "down")

if [[ "$1" == "toggle" ]]; then
  if [[ "$STATUS" == "up" ]]; then
    nmcli connection down id "$CONNECTION"
  else
    nmcli connection up id "$CONNECTION"
  fi
else
  if [[ "$STATUS" == "up" ]]; then
    echo "{\"text\": \"VPN\", \"class\": \"vpn-connected\", \"tooltip\": \"VPN Activado\"}"
  else
    echo "{\"text\": \"VPN\", \"class\": \"vpn-disconnected\", \"tooltip\": \"VPN Desactivado\"}"
  fi
fi   