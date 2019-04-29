#!/bin/bash
#
# Plexify.sh
#
# This script accepts a video file as input and transcodes it to lower bitrate 
# 2160p, 1080p, and 720p copies depending on the source resolution.

PATH="/usr/local/bin/:${PATH}"
readonly handbrake=$(command -v HandBrakeCLI)
readonly input=${1}
readonly input_dir=$(dirname "${input}")
readonly filename=$( echo ${input} | sed s:"${input_dir}/":: )
readonly title_name=$(basename "${input}" | sed 's/\.[^.]*$//')
readonly height=$(ffprobe -v error \
  -show_entries stream=width,height \
  -of default=noprint_wrappers=1 "${input}" \
  | grep -v "N/A" \
  | grep "height" \
  | sed s/[a-z]*[=]//)

function transcode() { 
  resolution=${1}
  framerate=${2}
  echo "$(date +"%H:%M:%S")"
  echo "Now transcoding \"${filename}\" to ${resolution}${framerate}."
  echo "This may take a while. Why don't you grab a ${3}"
  ${handbrake} --preset-import-gui \
  -Z "${resolution}${framerate} mkv subtitles" \
  -i "${input}" \
  -o "${input_dir}/${title_name} - ${resolution}.mkv" \
  &> "${input_dir}/${title_name} - ${resolution} $(date +"%Y-%m-%d %H-%M-%S").log"
  echo "$(date +"%H:%M:%S")"
  echo "Finished transcoding \"${filename}\" to ${resolution}${framerate}."
  echo
}

transcode '720p' '30' '☕'

if [ ${height} -gt '720' ]; then
  transcode '1080p' '60' '🥪'
fi

if [ ${height} -gt '1080' ]; then
  transcode '4k' '60' '😴'
fi

echo "Finished transcoding \"${filename}\""
echo
