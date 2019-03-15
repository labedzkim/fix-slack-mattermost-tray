# fix-slack-mattermost-tray
Scripts fixing the size of tray icons of Slack and Mattermost in KDE environment.

This is the one of possible fixes. Please refer to [Other fixes](#other-fixes) to learn about other possibilities.

## What do I need to install before use?

The scripts validate necessary dependencies. Anyway, the following packages are used:

- ImageMagick
- NodeJs + Asar (only for Mattermost)

## How does it work?

In KDE, for some reason, the tray icons are rendered too large.

Considering the above, the tray icons may be resized in such a way that the visible paintings are smaller but the physical dimensions of the images stay the same.

Look into the `samples` directory to see the results.

## Other fixes

The other possible fix is describered on [forum.kde.org]. 

[forum.kde.org]:https://forum.kde.org/viewtopic.php?f=289&t=139804&sid=126b7c810ffe90ca3247790b364770ea&p=400696#p400696

## What can I configure?

In the `settings` file you can find the configurable parameters, each of them explained in comments.

## How can I try it before use?

You can test the conversion on a sample file: `samples/sample.png`. There is an example of a fixed version of that sample as well: `samples/sample.png.fixed`. 

To make your own conversion please type `fix-image.sh samples/sample.png` and compare the new `sample.png` with its backup copy saved into a `sample.png.original`.