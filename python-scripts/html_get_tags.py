#!/usr/bin/env python

from bs4 import BeautifulSoup

soup = BeautifulSoup(open('./page.html'), 'html5lib')

f = open('regs.txt', 'w')
for res in soup.find_all('pre'):
    seq = res.encode('utf-8').splitlines()
    reg = ';'.join(seq)
    output=reg.replace(";;",";").replace("<pre>","").replace("</pre>","")
    f.write(output)
    f.write("\n")
    print output

