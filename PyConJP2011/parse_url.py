#!/usr/bin/env python
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

import pprint
pp = pprint.PrettyPrinter(indent = 4)

from urlparse import urlparse

result = urlparse('http://example.com:4567/')
print pp.pformat(result)

result = urlparse('http://[fe80::1%en0]:7890/')
print pp.pformat(result)
print 'hostname: ' + result.hostname
print 'port:     ' + str(result.port)


