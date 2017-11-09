#!/bin/sh
def_vars() {
	wifi_ip="172.16.0.0"
	author_name="QW50b25pbyBGZWl0b3NhCg=="
	author_url="aHR0cDovL3R3aXR0ZXIuY29tL3RlZWJzZAo="
	whois_server="whois.radb.net"
	dep_cmd="whois iptables"
	AS_FACEBOOK="AS32934 AS54115 AS34825"
	AS_GOOGLE="AS15169 AS26910 AS36561 AS6432 AS36492 AS43515 AS11344 AS40873 AS22577 AS36040 AS13949 AS19425 AS1424 AS1406 AS22244 AS55023 AS36384 AS41264"
	AS_TWITTER="AS13414 AS35995 AS54888 AS63179 AS63194"
	AS_AKAMAI="AS12222 AS16702 AS20940 AS21342 AS21399 AS31107 AS31108 AS31109 AS31110 AS31377 AS35993 AS39836 AS21357 AS21399 AS23903 AS24319 AS33905 AS34164 AS34850 AS35204 AS18680 AS18717 AS20189 AS35994 AS23454 AS22207 AS23455 AS43639 AS22207 AS16625"
	AS_AKAMAIHD="AS6762"
	#AS="$AS_FACEBOOK $AS_GOOGLE $AS_TWITTER $AS_AKAMAI $AS_AKAMAIHD"
	AS="$AS_FACEBOOK"
}

run_deps() {
	for cmd in $dep_cmd
	do
		which $cmd 2>/dev/null 1>&2 || (echo "$cmd not found!";exit 2) || exit 2
	done
}

query_as() {
	QUERY_AS_RET=$(whois -h $whois_server "!g$1" | grep "/" | sed ':a;N;$!ba;s/\n//g'; echo)
}

create_rule() {
	for network in $1
	do
		echo "iptables -I FORWARD -s ${wifi_ip}/12 -d $network -j REJECT"
	done
}

main() {
	for as_item in $AS
	do
		query_as $as_item
		for line in $QUERY_AS_RET
		do
			create_rule $line
		done
	done
}

def_vars
run_deps
main
