#!/usr/bin/env python

import os
import platform
import re
import socket
import sys

DEBUG=1

def usage():
    print ("./check_rule IP")
    return 1

def valid_ip(host):
    try:
        socket.inet_aton(host)
        # legal
        return True
    except socket.error:
        # Not legal
        return False

def valid_mac(mac):
    if mac != None:
        if re.match("[0-9a-f]{2}([-:])[0-9a-f]{2}(\\1[0-9a-f]{2}){4}$", mac.lower()):
            return True
        else:
            return False
    else:
        return False


def search_mac(ip):
    if valid_ip(ip):
        fields = os.popen('sudo grep -i "%s " /proc/net/arp' % ip.upper()).read().split()
        #fields = os.popen('grep "%s " proc_arp' % ip).read().split()
        if len(fields) == 6 and fields[3] != "00:00:00:00:00:00":
            return fields[3]
        else:
            return None

def search_rule(mac):
    if valid_mac(mac):
        fields = os.popen('sudo iptables-save | grep -i "%s "' % mac.upper()).read().split()
        #fields = os.popen('grep -i "%s " ip_save' % mac).read().split()
        if len(fields) > 5:
            print('Debug mac:"%s"' % fields[5])
            return fields[5]
        else:
            return None

def get_os():
    ostype = platform.system()
    if DEBUG == 1:
        if ostype == "Linux":
            print("Achei Linux")
        else:
            print("Achei OUTRO!")
            print(ostype)
    return ostype

def main(host):
    mac = search_mac(host)
    rule = search_rule(mac)
    #rule = None
    print('IP:\t"%s"' % host)
    print('MAC:\t"%s"' % mac)
    if rule:
        print('Regra:\tSIM')
    else:
        print('Regra:\tnao')



if __name__ == '__main__':
    if len(sys.argv) > 1:
        main(sys.argv[1])
    else:
        usage()
