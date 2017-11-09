#!/bin/bash
for ip in $(wget -O - http://rules.emergingthreats.net/blockrules/emerging-tor.rules 2>/dev/null | awk '/^alert/{sub(/\[/,"",$3);sub(/\]/,"",$3);print $3}' |  tr ',' '\n')
do
  iptables -I FORWARD -s $ip -m comment --comment "[#2520074_ToR Exit Node]" -j DROP
  iptables -I FORWARD -d $ip -m comment --comment "[#2520074_ToR Exit Node]" -j DROP
  iptables -I INPUT -s $ip -m comment --comment "[#2520074_ToR Exit Node]" -j DROP
  iptables -I INPUT -d $ip -m comment --comment "[#2520074_ToR Exit Node]" -j DROP
done
