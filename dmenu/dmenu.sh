#!/bin/bash
# TODO: dynamic font
dmenu_conf="-m 0 -nb #000000 -nf #ffffff -sb #222222 -sf #ffffff -i"

spawn_firefox() {
  choices="Clandestine\nMr Templado"
  choice=$(echo -e $choices | dmenu -p "Firefox" $dmenu_conf -fn "xos4 Terminus:size=9")
  [ ${#choice} -ne 0 ] && firefox -p "$choice" 2> ~/.dwm.log
}

run() {
  dmenu_run $dmenu_conf -fn "xos4 Terminus:size=9"
}

case $1 in
  firefox )
    spawn_firefox
    ;;
  run | *)
    run
    ;;
esac
