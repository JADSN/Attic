#!/bin/bash
FILE=$HOME/.hosts
echo 'l localhost' > $FILE
LC_ALL=C lxc list | awk '/RUNNING/ { print $2,$6} ' >> $FILE 
