#!/usr/bin/env ruby
# vim: set noet ts=4 sts=4 sw=4:
# author: takano32 <tak at no32.tk>
#

require './pureimage'

sio = StringIO.new
img = PureImage::Image.new(32, 32)
io = PureImage::PNGIO.new
io.save(img, "test_pureimage.png")

