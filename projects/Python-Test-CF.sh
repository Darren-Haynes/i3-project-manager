#!/bin/bash

shopt -s globstar nullglob

dir=/home/darren/CodeFellows/Python-Test-CF
all_files=**/*
gvim_all_files=$dir$all_files
cd $dir

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/pyscripting-gvim.json"

(gvim  $gvim_all_files &)
sleep 0.1

(urxvt -e ipython3 &)
sleep 0.1


(urxvt -e ipython2 &)
sleep 0.01

(urxvt &)
