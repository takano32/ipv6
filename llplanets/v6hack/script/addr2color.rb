#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :

exit if ARGV.empty?

rgb_array = ARGV.join.split('::').last.split(':')[0..-2]

rgb = '#' + rgb_array.map do |c|
	sprintf('%02X', c.to_i(16))[0..2]
end.join

puts rgb

