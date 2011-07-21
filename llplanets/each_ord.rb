#! /usr/bin/env ruby1.9
# vim: set noet ts=4 sts=4 sw=4:
# author: takano32 <tak at no32.tk>
#

exit if ARGV.empty?

ARGV.join.each_char do |ch|
	puts %Q!#{ch} => 0x#{sprintf("%X", ch.ord)}(#{ch.ord})!
end

