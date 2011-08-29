#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :
# sudo ifconfig gif1 inet6 add 2001:2e8:406:32::3
#
# sudo route delete -inet6 default
# sudo route  add -inet6 default 2001:2e8:406:11::1
#

IF='gif1'
NETWORK='2001:2e8:406:11'

if __FILE__ == $0 then
  (269730).upto 2**128 do |i|
    break if i == 16777215
    addr = sprintf("%X\n", i).reverse.scan(/.{1,2}/).reverse.map do |hex|
      hex.reverse
    end.join(':')
    puts %Q!sudo ifconfig #{IF} inet6 add #{NETWORK}:#{addr}:0/64!
  end
end

