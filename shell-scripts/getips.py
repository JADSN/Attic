#!/usr/bin/env python

# -*- mode: python -*-
# vi: set ft=python :

from scapy.all import *

ips = set()
macs = set()

myfilename = 'file.pcap'
pcap = PcapReader(myfilename)

print ("Reading file {}".format(myfilename))

for p in pcap:
	if IP in p:
		ips.add((p[IP].src, p[IP].dst))
	if Ether in p:
		macs.add((p[Ether].src, p[Ether].dst))


for src,dst in ips:
	print "{}\n{}".format(src,dst)