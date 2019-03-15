#!/bin/bash

slackPath="/usr/lib/slack"
imagesDir="$slackPath/resources/app.asar.unpacked/src/static"
basePath=`dirname \`realpath $0\``
imagesToBeFixed="slack-taskbar-highlight.png slack-taskbar-rest.png slack-taskbar-unread.png"

echo "Using Slack path: $slackPath"
echo "The following files will be fixed:"
for file in $imagesToBeFixed;
do
    echo "$imagesDir/$file"
done

read -rsp $'Press any key to continue...\n' -n 1 key

set -e

echo "Fixing..."
for file in $imagesToBeFixed;
do
    sudo $basePath/fix-image.sh "$imagesDir/$file"
done

echo "Done."