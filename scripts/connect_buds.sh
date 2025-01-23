#!/bin/bash

BUDS_MAC="64:03:7F:BB:42:09"
bluetoothctl power on
sleep 2

if (bluetoothctl connect $BUDS_MAC 2>&1 | grep -q "Connection successful"); then
  notify-send "Bluetooth" "Galaxy Buds connected successfully" -i bluetooth-active
else
  notify-send "Bluetooth" "Failed to connect Galaxy Buds" -i bluetooth-disabled
fi

bluetoothctl trust $BUDS_MAC
