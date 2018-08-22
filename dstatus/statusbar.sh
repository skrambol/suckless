#!/bin/bash

print_vol() {
  vol=`amixer -M get Master | ag "\d+%" -o` 2>> /dev/null
  sym=''
  echo -e "$sym$vol"
}

print_bat() {
  bat=`acpi | cut -d, -f2`
  sym=$([ -z $bat ] && echo "" || echo "")
  echo -e "$sym$bat"
}

print_datetime() {
  echo -e `date +"(%a) %b %d; %H:%M:%S"`
}

print_cpu() {
  echo -e `top -b -n1 | awk '/Cpu\(s\)/ {printf "%2d%%", $2+$4}'`
}

print_ram() {
  echo -e `top -b -n1 | awk '/MiB Mem/ {printf "%2d%%", $8/$4*100}'`
}

while true; do
  xsetroot -name "`print_vol`  `print_cpu`  `print_ram`  `print_bat`  `print_datetime`"
  sleep 1
done
