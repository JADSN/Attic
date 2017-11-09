#!/bin/bash
DEBUG=1


function listrunningvms {
	local vm=
	for vm in $(VBoxManage list runningvms | awk '{print $1}' | tr -d '"')
	do
		echo $vm
	done

}


function main {
	local vm=
	for vm in $(listrunningvms)
	do
		VBoxManage controlvm $vm acpipowerbutton
	done
}

main
