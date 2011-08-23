#!/usr/bin/env ruby
# vim: set noet ts=4 sts=4 sw=4:
# author: takano32 <tak at no32.tk>
#

require 'rubygems'
require 'RMagick'

img = Magick::Image.new(640, 480) do
  self.background_color = '#336699'
  self.format = 'png'
end

puts img.to_blob


