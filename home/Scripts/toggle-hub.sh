#!/bin/bash

# Script simple: mata quickshell si está corriendo, o lo inicia si no lo está

QS_PID=$(pgrep -f "quickshell.*my-hub")

if [ -n "$QS_PID" ]; then
  # Si está corriendo, matarlo
  kill $QS_PID
else
  # Si no está corriendo, iniciarlo
  quickshell -c my-hub &
  disown
fi
