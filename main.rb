#!/usr/bin/ruby

require 'timeout'

freq = 1420405751.786
duration = 10 #minutes 


now = Time.now

filename = now.strftime("%Y%m%dT%H%M%SZ") + ".raw"

cmd = "rtl_fm -f #{freq} ./captures/#{filename}"
system "timeout #{duration}m #{cmd}"
system "scp ./captures/#{filename} jason@saturn.lan.whitehorn.us:#{filename} && rm ./captures/#{filename}"
