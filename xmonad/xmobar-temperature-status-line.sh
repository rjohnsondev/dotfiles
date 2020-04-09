#!/bin/sh
gpu=$(nvidia-smi -q -d temperature | awk '/GPU Current Temp/{print $5}')
cpu=$(sensors -u k10temp-pci-00c3 | awk '/temp1_input:/{printf "%.0f", $2}')
echo "CPU: ${cpu}°C | GPU: ${gpu}°C"
