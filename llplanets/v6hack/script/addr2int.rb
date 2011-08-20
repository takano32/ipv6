#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :

exit if ARGV.empty?

puts ARGV.join.split('::').last.split(':').join.to_i(16)

