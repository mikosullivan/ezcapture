#!/usr/bin/ruby -w
require 'ezcapture'
require 'tatum/stdout'

cap = EzCapture.new('/usr/bin/ls')
puts cap.status.class

# done
puts '[done]'
