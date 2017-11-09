#!/bin/bash

(dd if=/dev/zero | pv -n -s 8022654976 - | dd of=/dev/sdb bs=512 count=15669248 conv=notrunc,noerror) 2>&1 | dialog --gauge "Running dd command (wiping), please wait..." 10 70 0
echo
echo 'To Check use: sudo hexdump -C /dev/sdb
Must display something like:

$ sudo hexdump -C /dev/sdb
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
1of300000
'
