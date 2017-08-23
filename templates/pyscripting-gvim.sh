#!/bin/bash

shopt -s globstar nullglob

dir=^PROJ_DIR^
all_files=/**/*
gvim_all_files=$dir$all_files
cd $dir

i3-msg "workspace Project; append_layout ^TEMP_DIR^"

(gvim  $gvim_all_files &)
sleep 0.1

(urxvt -e ipython &)
sleep 0.01

(urxvt -e ipython2 &)
sleep 0.01

(urxvt &)

