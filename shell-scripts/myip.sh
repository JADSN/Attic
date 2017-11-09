#!/bin/sh

function myip {
	API_URL="http://bot.whatismyipaddress.com"
	myIP=$(curl $API_URL 2>/dev/null)
}

function main {
	myip
	echo $myIP
}

main
