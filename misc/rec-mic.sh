#!/bin/bash

ffmpeg -f pulse -i default "$(date +%Y-%d-%H-%M-%S | tr A-Z a-z).wav"
