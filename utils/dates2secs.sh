#!/bin/bash

# Time Arithmetic, https://stackoverflow.com/a/55153558/529286

TIME1="$1"
TIME2="$2"

# Convert the times to seconds from the Epoch
SEC1=`date +%s -d ${TIME1}`
SEC2=`date +%s -d ${TIME2}`

# Use expr to do the math, let's say TIME1 was the start and TIME2 was the finish
DIFFSEC=`expr ${SEC2} - ${SEC1}`

echo Start ${TIME1}
echo Finish ${TIME2}

echo Took ${DIFFSEC} seconds.

# And use date to convert the seconds back to something more meaningful
echo Took `date +%H:%M:%S -ud @${DIFFSEC}`
