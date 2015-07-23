# encoding: utf-8

require 'rubygems'
require 'skype'

require 'net/http'
require 'uri'
require 'json'
require './knowhow.rb'

Skype.config :app_name => "byun_bot" 

hearing_threshold = 10
last_id = 0
last_time = Time.now.to_i                  

loop do
  ttime=Time.now
  Skype.chats.each do |chat|
#	p m1
#	p m1.id
#	p m1.user
#	p m1.body
#	p m1.time

    chat.messages.each do |m|
		if ((Time.now.to_i() -1) <= m.time.to_i) then
			puts Time.now.to_i
	    	puts "last_time=" + last_time.to_s
    		puts "last_id=" + last_id.to_s
   			p m
		end
      
      unless last_id < m.id
		next
      end

      last_time = m.time.to_i
      
      next unless ttime.to_i - last_time < hearing_threshold
      if m.body.include? ">bot" then
	  	p "test1"
      end
      last_id = m.id
   end

  end
  sleep 1
end
