#!/bin/bash
i3-msg "workspace Dotfiles; append_layout /home/darren/i3-project-manager/templates/pyscripting.json"

cp ~/.Xresources ~/.which_color/xresources_vim
(urxvt -e vim ~/Py_Scripts/* &)
sleep 0.1
python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_ipython
(urxvt -e ipython &)
sleep 0.01
python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_ipython2
(urxvt -e ipython2 &)
sleep 0.01
python ~/Py_Scripts/xr_random_colors.py
cp ~/.Xresources ~/.which_color/xresources_urxvt
(urxvt &)

