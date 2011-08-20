#!/usr/bin/env ruby1.9
# vim: set sts=2 sw=2 ts=2 ft=ruby :

100000.to_s(16).reverse.scan(/.{1,4}/).join(':').reverse

