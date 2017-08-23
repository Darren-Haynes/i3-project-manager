#!/bin/bash

shopt -s globstar nullglob

# OPEN LAYOUT IN I3 AND SWALLOW WINDOWS
i3-msg "workspace Mobile; append_layout ~/test_mobile.json"

cd /home/darren/freeCodeCamp/wikipedia-viewer

(chromium --disable-gpu --new-window http://localhost:3000 &)
sleep 0.1

(urxvt -e browser-sync start --server --no-open --files "css/*.css" "*.html" &)
sleep 0.1

(chromium --disable-gpu --new-window http://localhost:3000 &)
sleep 1

WID=$(xdotool search --class Chromium | tail -2)


DEVICE=1

reset_defaults () {
  xdotool key F12
  sleep 0.5
  xdotool key F1
  sleep 0.5

  for i in range{1..43}; do
    xdotool key Tab
    sleep 0.001
  done

  xdotool key Return
  sleep 0.1
}

choose_device () {
  xdotool key Control_L+Shift_L+m
  sleep 0.05

  for i in range{1..3}; do
    xdotool key Tab
    sleep 0.001
  done

  xdotool key Return
  sleep 0.1

  for ((i=1; i<=DEVICE; i++)); do
    xdotool key Down
    sleep 0.001
  done

  xdotool key Return
  sleep 0.1
}

window_setup () {
  sleep 0.05
  xdotool key Control_L+l
  sleep 0.05
  xdotool key Control_L+c
  sleep 0.05

  if (( $1 > 1 )); then
    echo "$1"
     xdotool key Control_L+t
     sleep 0.05
     xdotool key Control_L+v
     sleep 0.05
    xdotool key Return
    sleep 0.1
  fi

  reset_defaults
  choose_device

}

PHONES=9
for chromium in $WID; do
  xdotool windowactivate "$chromium"
  echo "chromum ID: $chromium"
  sleep 0.05

  for ((i=1; i<=PHONES; i++)); do
    let DEVICE+=1
    window_setup $i
  done
done

####THIS SECTION WILL BE COMMMENTED OUT BUT MAYBE USED FOR FUTURE
####

# phones position in developer tools list of devices
#GalaxyS5=23
#Nexus5X=24
#Nexus6P=25
#iPhone6=27
#iPhone6Plus=28
#
## tablets position in developer tools list of devices
#iPad=29
#iPadPro=30
#kindleFireHDX=7
#
## responsive view position in developer tools
#responsive=1
#
#
## array of phones to open in tabs in window 1
#phones=("$iPhone6" "$iPhone6Plus" "$Nexus5X" "$Nexus6P" "$GalaxyS5")
## array of tablets and responsive view to open in tabs in window 2
#tablets=("$iPad" "$iPadPro" "$responsive" "$kindleFireHDX")
#
####
####FUTURE COMMENT SECTION ENDS


# get the 2 open chromium windows IDs
