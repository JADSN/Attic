#!/bin/sh
seconds=5
while true
do
	clear
	echo -n "Date: $(date) | "
	echo "Interval: $seconds secs"
	echo
	$1
	sleep $seconds
done
