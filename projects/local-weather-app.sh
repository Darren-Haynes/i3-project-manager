#!/bin/bash

shopt -s globstar nullglob

dir=/home/darren/freeCodeCamp/local-weather-app
cd $dir

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/codepen.json"


python ~/Py_Scripts/xr_random_colors.py
(urxvt -e vim **/*.html &)
sleep 0.1


python ~/Py_Scripts/xr_random_colors.py yes
(urxvt -e vim **/*.js &)
sleep 0.1


python ~/Py_Scripts/xr_random_colors.py
(urxvt &)
sleep 0.1


python ~/Py_Scripts/xr_random_colors.py yes
(urxvt -e vim **/*.css &)
sleep 0.1

