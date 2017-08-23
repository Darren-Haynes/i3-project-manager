#!/bin/bash

shopt -s globstar nullglob

dir=/home/darren/freeCodeCamp/local-weather-app
cd $dir

html_files="**/*.html"
js_files="**/*.js"
css_files="**/*.css"

i3-msg "workspace Project; append_layout /home/darren/i3-project-manager/templates/codepen.json"


(gvim $html_files &)
sleep 0.1

(gvim $js_files &)
sleep 0.1

(urxvt &)
sleep 0.1

(gvim $css_files)
sleep 0.1

