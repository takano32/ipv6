#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :

exit if ARGV.empty?

id = ARGV.join.to_i
host = id.to_s(16).reverse.scan(/.{1,4}/).join(':').reverse
network = '2001:2e8:406:11'
puts network + "::" + host

