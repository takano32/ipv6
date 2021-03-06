#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :
# sudo ifconfig gif1 inet6 add 2001:2e8:406:32::3
IF='en0'

if __FILE__ == $0 then
  1.upto 2**128 do |i|
    break if i == 2**64
    addr = sprintf("%X\n", i).reverse.scan(/.{1,4}/).reverse.map do |hex|
      hex.reverse
    end.join(':')
    puts %Q!sudo ifconfig #{IF} inet6 add fe80::#{addr}/64!
  end
end

