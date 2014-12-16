#!/bin/bash

# Accepts target of test and time between attempts as args
# Also accepts number of iterations as arg
target=$1
sleepTimeMin=$2
maxiterations=$3

#Calculates sleep time in Minutes
let sleepTimeSec=60*$sleepTimeMin

#Set variables and create/overwrite log
echo "Starting Up" > $target.log
echo "" >> $target.log

#Start while Loop that will continue until reaches max iterations
i=0

while  [ $i -lt $maxiterations ]; do

#put date in log
echo $(date) >> $target.log

#tests if host can be resolved to IP and writes to log
host -t a $target >> $target.log

if [ $? -eq 0 ]
then

	echo "Can Resolve Domain to IP " $target >> $target.log

else

	echo "Can NOT Resolve Domain to IP " $target >> $target.log

fi

#pings once determines outcome and writes to log
count=$( ping -c 1 $target | grep icmp* | wc -l )

if [ $count -eq 0 ]
then

    echo "Host is NOT Pingable" $target >> $target.log

else

    echo "Host is Pingable" $target >> $target.log

fi

#increments iteration
let i=i+1

#Write to stdout iteration, date and sleep time
echo "Iteration: " $i
echo $(date)
echo "Sleeping for $sleepTimeMin minutes"
echo "" >> $target.log

#waits to start next iteration
sleep $sleepTimeSec

done

#Writes to stdout and log when done
echo "Done." >> $target.log
echo "Done."
