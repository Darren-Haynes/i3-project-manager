#!/bin/bash

shopt -s globstar nullglob

dir=/home/darren/freeCodeCamp/personal-portfolio
cd $dir

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/codepen.json"

html_files="**/*.html"
js_files="**/*.js"
css_files="**/*.css"


(gvim $html_files)
sleep 0.1

(gvim $js_files)
sleep 0.1

(urxvt &)
sleep 0.1

(gvim $css_files)
sleep 0.1
