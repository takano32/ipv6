#!/usr/bin/env python
# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4

from http.server import HTTPServer, SimpleHTTPRequestHandler
#import SimpleHTTPServer
#import SocketServer

PORT = 8000

Handler = SimpleHTTPRequestHandler

httpd = HTTPServer((0, PORT), Handler)

print("serving at port", PORT)
httpd.serve_forever()

