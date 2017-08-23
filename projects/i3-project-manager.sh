#!/bin/bash

shopt -s globstar

dir=/home/darren/i3-project-manager

py_files="/**/*.py "
py_p=$dir$py_files

txt_files="/**/*.txt "
txt_p=$dir$txt_files

sh_files="/**/*.sh "
sh_p=$dir$sh_files

json_files="/**/*.json "
json_p=$dir$json_files

gvim_all_files=$py_p$json_p$sh_p$txt_p

cd $dir

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/pyscripting-gvim.json"

(gvim  $gvim_all_files &)
sleep 0.1

(urxvt -e ipython3 &)
sleep 0.1

(urxvt -e ipython2 &)
sleep 0.1

(urxvt &)
