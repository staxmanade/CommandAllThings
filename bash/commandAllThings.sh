#!/bin/bash

command=''

if [ -e "gulpfile.js" ]; then
	command=gulp
elif [ -e "gruntfile.js" ]; then
	command=grunt
elif [ -e "makefile" ]; then
	command=make
elif [ -e "rakefile" ]; then
	command=rake
else
	echo 'could not find a known task file (ex: gulpfile.js, gruntfile.js, rakefile)'
fi

if [ -n "$command" ]; then
	fullCommand=$(which $command | grep -v commandAllThings | head -n 1)
	if [ $# -eq 0 ]; then
	  $fullCommand
    else
	  $fullCommand "$*"
    fi
fi
