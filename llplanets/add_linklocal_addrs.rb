#!/usr/bin/env ruby1.9

IF='en0'

if __FILE__ == $0 then
	1.upto 2**128 do |i|
		addr = sprintf("%X\n", i).reverse.scan(/.{1,4}/).reverse.map do |hex|
			hex.reverse
		end.join(':')
		puts %Q!sudo ifconfig #{IF} inet6 add fe80::#{addr}/64!
	end
end

