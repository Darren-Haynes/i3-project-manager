#!/bin/bash

shopt -s globstar

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/pyscripting.json"

python ~/Py_Scripts/xr_random_colors.py
(urxvt -e vim ~/Py_Scripts/**/* &)
sleep 0.1

python ~/Py_Scripts/xr_random_colors.py
(urxvt -e ipython3 &)
sleep 0.01

python ~/Py_Scripts/xr_random_colors.py
(urxvt -e ipython2 &)
sleep 0.01

python ~/Py_Scripts/xr_random_colors.py
(urxvt &)

