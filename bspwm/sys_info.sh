#!/bin/bash

top=$(top -b -n 1 | grep %Cpu)
us=$(echo $top | awk '{ print $2 }' | sed 's/\.//')
sy=$(echo $top | awk '{ print $4 }' | sed 's/\.//')
avg=$(($us + $sy))

echo $(($avg / 10)).$(($avg % 10))
