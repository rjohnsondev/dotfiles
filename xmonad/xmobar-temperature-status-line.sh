#!/bin/sh
cpu=$(sensors -u k10temp-pci-00c3 | awk '/temp1_input:/{printf "%.0f", $2}')
gpu=$(sensors -u amdgpu-pci-2800 | awk '/temp1_input:/{printf "%.0f", $2}')
echo "CPU: ${cpu}°C | GPU: ${gpu}°C"
