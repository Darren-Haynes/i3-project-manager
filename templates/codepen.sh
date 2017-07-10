#!/bin/bash

shopt -s globstar nullglob

dir=^PROJ_DIR^
cd $dir

i3-msg "workspace Project; append_layout ^TEMP_DIR^"


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

