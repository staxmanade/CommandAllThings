#!/bin/bash

command=''

if [ -e "gulpfile.js" ]; then
	command=gulp
elif [ -e "gruntfile.js" ]; then
	command=grunt
elif [ -e "jakefile" ]; then
	command=jake
elif [ -e "makefile" ]; then
	command=make
elif [ -e "rakefile" ]; then
	command=rake
else
	echo 'CommandAllThings: could not find a known task file (ex: gruntfile.js, gulpfile.js, jakefile, makefile, or rakefile)'
fi

if [ -n "$command" ]; then
	fullCommand=$(which $command | grep -v commandAllThings | head -n 1)
	if [ $# -eq 0 ]; then
	  $fullCommand
    else
	  $fullCommand "$*"
    fi
fi
