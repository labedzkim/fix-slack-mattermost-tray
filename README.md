# fix-slack-mattermost-tray
Scripts fixing the size of tray icons in Slack and Mattermost

## What do I need to install before use?

The scripts validate necessary dependencies. Anyway, the following packages are used:

- ImageMagick
- NodeJs + Asar (only for Mattermost)

## How does it work?

The tray icons needs to be resized in such a way that the visible paintings are smaller but the physical dimensions of the images stay the same.

## What can I configure?

In the `settings` file you can find the configurable parameters, each of them explained in comments.

## How can I try it before use?

You can test the conversion on a sample file: `samples/sample.png`. There is an example of a fixed version of that sample as well: `samples/sample.png.fixed`. 

To make your own conversion please type `fix-image.sh samples/sample.png` and compare the new `sample.png` with its backup copy saved into a `sample.png.original`.