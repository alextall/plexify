# Plexify

This shell script uses [HandBrakeCLI](https://handbrake.fr) and transcodes videos to equal and smaller resolutions including 4k (3840x2160), 1080p (1920x1080), and 720p (1280x720). The settings applied have been exported to the presets folder, and can be imported to Handbrake for use and adjustment.

## Install

`plexify` may be installed using Homebrew.
1. Run `brew tap alextall/tools` to tap my cask.
2. Then run `brew install plexify`.

## Dependencies

* Install [HandbrakeCLI](https://handbrake.fr).
* Install [ffmpeg](http://http://ffmpeg.org)
* Optional: Install [Hazel](https://www.noodlesoft.com) according to Noodlesoft's instructions.

## Use

Simply run `plexify [File]` from the Terminal.

`plexify` will accept just about any video you can find, but I recommend using [MakeMKV](http://makemkv.com) to rip full quality .mkv files of your DVDs and Blu-rays.

**Note:** Video transcoding takes a long time, especially if you are transcoding several files or high resolution files. I highly recommend doing this on a dedicated computer, over night, or at another time when you won't need to use your computer.

## Using Hazel

Set up [Hazel](https://www.noodlesoft.com) to watch a folder and create a rule with the following criteria:

	If ALL of the following conditions are met
	KIND IS Movie
	Do the following to the matched file or folder:
	RUN SHELL SCRIPT
	and choose plexify.

You can now place your video files into the folder watched by Hazel, and Hazel will automatically trigger `plexify` to do its work.