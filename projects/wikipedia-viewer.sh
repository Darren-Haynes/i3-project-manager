#!/bin/bash

shopt -s globstar nullglob

dir=/home/darren/freeCodeCamp/wikipedia-viewer
cd $dir

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/codepen.json"


(gvim  /home/darren/freeCodeCamp/wikipedia-viewer/**/*.html &)
sleep 0.1

(gvim  /home/darren/freeCodeCamp/wikipedia-viewer/**/*.js &)
sleep 0.1

(urxvt &)
sleep 0.1

(gvim  /home/darren/freeCodeCamp/wikipedia-viewer/**/*.css &)
sleep 0.1
