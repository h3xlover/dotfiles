#!/bin/bash

ffmpeg -vaapi_device /dev/dri/renderD128 -video_size 3440x1440 -framerate 60 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default -crf 0 -vf 'format=nv12,hwupload' -c:v h264_vaapi "$(date +%Y-%d-%H-%M-%S | tr A-Z a-z).mkv"
