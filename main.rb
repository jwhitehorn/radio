#!/usr/bin/ruby

require 'timeout'

freq = 1420405751.786
duration = 720 #minutes 
path = "/home/jason/radio/captures"


now = Time.now

filename = now.strftime("%Y%m%dT%H%M%SZ") + ".raw"

cmd = "/usr/local/bin/rtl_fm -f #{freq} #{path}/#{filename}"
system "timeout #{duration}m #{cmd}"
system "scp #{path}/#{filename} jason@saturn.lan.whitehorn.us:#{filename} && rm #{path}/#{filename}"
