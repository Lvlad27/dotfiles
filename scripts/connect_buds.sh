#!/bin/bash

BUDS_MAC="64:03:7F:BB:42:09"
bluetoothctl power on
sleep 2
if echo "connect $BUDS_MAC" | bluetoothctl | grep -q "Connection succesful"; then
  notify-send "Bluetooth" "Galaxy Buds connected succesfully" -i bluetooth-active
else
  notify-send "Bluetooth" "Failed to connect Galaxy Buds" -i bluetooth-disabled
fi
echo "trust $BUDS_MAC" | bluetoothctl
