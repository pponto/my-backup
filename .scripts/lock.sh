#!/bin/bash
temp_file="/tmp/screen.png"
icon="$HOME/.scripts/rm_lock.png"
width=1920
height=1080
blur_factor=6
lock_blur_factor=0

ffmpeg -f x11grab -video_size "${width}x${height}" -y -i $DISPLAY -i $icon -filter_complex "boxblur=$blur_factor:$blur_factor,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2,boxblur=$lock_blur_factor:$lock_blur_factor" -vframes 1 $temp_file
i3lock --no-unlock-indicator --ignore-empty-password --image=$temp_file
rm $temp_file