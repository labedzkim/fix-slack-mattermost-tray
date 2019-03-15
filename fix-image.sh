#!/bin/bash

command -v convert >/dev/null 2>&1 || { 
		echo >&2 "The 'convert' tool from ImageMagick package is required. More on https://www.imagemagick.org."; 
		exit 1; 
	}

basePath=`dirname \`realpath $0\``
source $basePath/settings

fixImage() {
	cp $1 $1.original
	convert $1 -resize $core_size $1.resized
	convert $1.resized -matte -bordercolor none -border $border $1
	rm $1.resized
}

if [ -z "$1" ] ; then echo "$0: File name required as param 1" ; exit 1; fi;

echo "Fixing $1 ..."
fixImage $1
