#!/usr/bin/env bash
usage() {
	echo $0 192.168.0 1 10
}
#SUBNET=200.142.111
if [ "x$1" == "x" ]
then
	usage
else
	SUBNET=$1
	for i in $(seq $2 $3)
	do
		host $SUBNET.$i
	done
fi

