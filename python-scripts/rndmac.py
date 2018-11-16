#!/usr/bin/env python
"""
print "52:54:00:%02x:%02x:%02x" % (
    random.randint(0, 255),
    random.randint(0, 255),
    random.randint(0, 255),
    )
"""

"""
print "%02x:%02x:%02x:%02x:%02x:%02x" % (
    random.randint(0, 255),
    random.randint(0, 255),
    random.randint(0, 255),
    random.randint(0, 255),
    random.randint(0, 255),
    random.randint(0, 255),
    )
"""
def hostname_random():
    import random
    print "%02x%02x%02x%02x%02x%02x" % (
            random.randint(0, 255),
            random.randint(0, 255),
            random.randint(0, 255),
            random.randint(0, 255),
            random.randint(0, 255),
            random.randint(0, 255),
    )

hostname_random()
