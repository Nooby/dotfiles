#!/usr/bin/env python

import sys
import array

permission_string = sys.argv[1]
permissions = ''
special_mode = ''

for idx, c in enumerate(permission_string):
    if idx == 0:
        pass
    else:
        if c in '-ST':
            permissions += '0'
        else:
            permissions += '1'

        if idx in (3, 6, 9):
            if c in 'STst':
                special_mode += '1'
            else:
                special_mode += '0'

special = int(special_mode, 2)
user = int(permissions[0:3], 2)
group = int(permissions[3:6], 2)
others = int(permissions[6:9], 2)

print('%s%s%s%s' % (special, user, group, others))
