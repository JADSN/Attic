#!/bin/bash

CONF_FILE=./vbox_autostart.conf


function listautostartvms {
	local vm=
	if [ ! -f $CONF_FILE ]
	then
		echo "$CONF_FILE not found!"
		exit 1
	fi
	for vm in $(cat $CONF_FILE)
	do
		echo $vm
	done

}


function main {
	local vm=
	for vm in $(listautostartvms)
	do
		VBoxManage startvm $vm --type headless
	done
}

main
