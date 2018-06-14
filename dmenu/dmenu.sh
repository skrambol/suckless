#!/bin/bash
dmenu_conf="-m 0 -fn Input:size=9 -nb #000000 -nf #ffffff -sb #222222 -sf #ffffff"

spawn_firefox() {
  choices="Clandestine\nMr Templado"
  choice=$(echo -e $choices | dmenu -p "Firefox" $dmenu_conf)
  [ ${#choice} -ne 0 ] && firefox -p "$choice" 2> ~/.dwm.log
}

run() {
  dmenu_run $dmenu_conf
}

case $1 in
  firefox )
    spawn_firefox
    ;;
  run | *)
    run
    ;;
esac
