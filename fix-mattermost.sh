#!/bin/bash

set -e

command -v asar >/dev/null 2>&1 || { 
		echo >&2 "The 'asar' tool is required. More on https://www.npmjs.com/package/asar"; 
		exit 1; 
	}

if [ ! -n "$1" ]; then echo "Path to Mattermost's 'app.asar' is needed as param 1"; exit 1 ; fi
if [ ! -w $1 ]; then echo "The '$1' needs to be writable" ; exit 1 ; fi

basePath=`dirname \`realpath $0\``
tmpDir=/tmp/mattermost-asar-tmp

echo "Working directory: $tmpDir"
rm -rf $tmpDir
mkdir $tmpDir

# Save original app.asar into a backup copy
backupCopy=$1.backupCopy-`date +%F`
echo "Saving a backup copy into $backupCopy"
cp $1 $backupCopy

# Extracting the app.asar
asar extract $1 $tmpDir

# Fixing images
imagesBase=$tmpDir/assets/linux
lightFiles=$imagesBase/light/MenuIcon*.[pP][nN][gG]
darkFiles=$imagesBase/dark/MenuIcon*.[pP][nN][gG]
allFiles="$darkFiles $lightFiles"
for fixedFile in $allFiles
do
	$basePath/fix-image.sh $fixedFile
done

# Packing a new app.asar
echo "Overriting $1 ..."
asar pack $tmpDir $1

echo "Done."