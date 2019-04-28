# Plexify

This shell script leverages [HandBrakeCLI](https://handbrake.fr) and adds my own settings.

Video transcoding takes a long time, especially if you are transcoding several files. I highly recommend doing this on a dedicated computer, over night, or at another time when you won't need to use your computer.

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

## Using Hazel

Place your video files into a folder watched by [Hazel](https://www.noodlesoft.com), and Hazel will automatically trigger `plexify` to do its work.

Set up Hazel to watch the work folder and create a rule with the following criteria:

	If ALL of the following conditions are met
	KIND IS Movie
	Do the following to the matched file or folder:
	RUN SHELL SCRIPT
	and choose plexify.
