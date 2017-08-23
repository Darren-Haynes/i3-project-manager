#!/bin/bash

shopt -s globstar nullglob

dir=^PROJ_DIR^
cd $dir

i3-msg "workspace Project; append_layout ^TEMP_DIR^"

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

