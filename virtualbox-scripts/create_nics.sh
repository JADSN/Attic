#!/bin/bash
DEBUG=

function isdigit {
	case $1 in
    	''|*[!0-9]*) return 1;;
		*) return 0;;
	esac
}

function usage {
	printf 'Usage: %s {name_of_vm} {interface_id}\n' $0
	printf '                                     |\n'
	printf '                                     `-- Can be 1 - 8\n'

	exit 1
}

function create_nic {
	[ -n "$DEBUG" ] && 	echo VBoxManage modifyvm $1 --nic$2 intnet
	VBoxManage modifyvm $1 --nic$2 intnet
	[ -n "$DEBUG" ] && 	echo VBoxManage modifyvm $1 --intnet$2 "intnet$2"
	VBoxManage modifyvm $1 --intnet$2 "intnet$2"

	return 0
}

function isvmdown {
	if 	[ -z "$1" ]
	then
		[ -n "$DEBUG" ] && 	echo "isvmdown() has no arg"
		exit 1
	fi
	xVM=$(VBoxManage list runningvms | awk '{print $1}' | tr -d '"' | grep $1)
	[ -n "$DEBUG" ] && echo "isvmdown($1)"
	[ "$xVM" == $1 ] && ISVMDOWN= || ISVMDOWN=1
	[ -n "$DEBUG" ] && echo "xVM=$xVM"
	[ -n "$DEBUG" ] && echo "ISVMDOWN=$ISVMDOWN"

	return 0
}


function isvmexist {
	if 	[ -z "$1" ]
	then
		[ -n "$DEBUG" ] && echo "isvmexist() has no arg"
		exit 1
	fi
	[ -n "$DEBUG" ] && echo "isvmexist($1)"

	xVM=$(VBoxManage list vms | awk '{print $1}' | tr -d '"' | grep $1)
	
	[ -n "$DEBUG" ] && echo "xVM=$xVM"
	[ "$xVM" == $1 ] && ISVMEXIST=1 || ISVMEXIST=
	[ -n "$DEBUG" ] && echo "ISVMEXIST=$ISVMEXIST"
	
	return 0
}

function main {
	 isdigit $2 && [ $2 -lt 9 ] && [ $2 -gt 0 ] && isvmexist $1 || usage
	[ -n "$ISVMEXIST" ] && isvmdown $1
	[ -n "$ISVMDOWN" ] && create_nic $1 $2
	return 0
}

[ -n "$2" ] && main $1 $2 || usage
