#!/bin/bash

originalCommand=$originallyCalledWith
#echo "orig: $originallyCalledWith"

cmdTypes=()

if [ -e "gulpfile.js" ]; then
	cmdTypes+=(gulp)
fi

if [ -e "gruntfile.js" ]; then
	cmdTypes+=(grunt)
fi
if [ -e "jakefile" ]; then
	cmdTypes+=(jake)
fi
if [ -e "makefile" ]; then
	cmdTypes+=(make)
fi
if [ -e "rakefile" ]; then
	cmdTypes+=(rake)
fi
if [ -e "build.gradle" ]; then
	cmdTypes+=(gradle)
fi

# Support for xbuild
if [ -e *.proj ]; then
	if [ $# -eq 0 ]; then
		xbuild
	else
		xbuild "/t:$@"
		exit $?
	fi
fi


fullCommand=$originalCommand
if [ ${#cmdTypes[@]} -eq 1 ]; then
	# if there is only one project type found - let's resolve that specific one.
	fullCommand=$(which ${cmdTypes[0]} | grep -v commandAllThings | head -n 1)
fi

if [ $# -eq 0 ]; then
  $fullCommand
else
  $fullCommand "$@"
fi
