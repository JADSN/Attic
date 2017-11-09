#!/usr/bin/env sh
usage() {
	echo $0 192.168.0 1 10
}
#SUBNET=192.168.0
if [ "x$1" == "x" ]
then
	usage
else
	SUBNET=$1
	for i in $(jot - $2 $3 1)
	do
		echo $SUBNET.$i
	done
fi

