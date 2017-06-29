#!/bin/bash

cd ~/freeCodeCamp/local-weather-app
i3-msg "workspace Dotfiles; append_layout /home/darren/i3-project-manager/templates/codepen.json"

cp ~/.Xresources ~/.which_color/xresources_html
(urxvt -e vim **/*.html &)
sleep 0.1

python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_js
(urxvt -e vim **/*.js &)
sleep 0.1

python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_urxvt
(urxvt &)
sleep 0.1

python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_css
(urxvt -e vim **/*.css &)

