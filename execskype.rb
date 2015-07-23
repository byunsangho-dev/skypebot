# encoding: utf-8

require 'rubygems'
require 'skype'

require 'net/http'
require 'uri'
require 'json'
require './knowhow.rb'

def bourbon
json = open('bourbon.json') do |io|
  JSON.load(io)
end

name=json
#name=json.map { |hash| hash["name"] }
l=name.length
i=rand(l -1)
name[i]
end



Skype.config :app_name => "byun_bot" 

hearing_threshold = 10
last_id = 0
last_time = Time.now.to_i                  

loop do
  Skype.chats.each do |chat|
    
    if chat.topic == ""
      p chat

      chat.messages.each do |m|

      puts Time.now
      puts "last_time=" + last_time.to_s
      puts "last_id=" + last_id.to_s
      p m
      
#      if chat.topic == "" && m.user == "byun.sangho"  then
#	p m.id
#      end

#      next unless last_id < m.id
      unless last_id < m.id
#	p " l_id=" + last_id.to_s + "m_id=" + m.id.to_s
	next
      end

      last_time = m.time.to_i
      
      next unless Time.now.to_i - last_time < hearing_threshold
#      chat.post bourbon() if m.body.include? ">bot"
#      chat.post knowhowInfo() if m.body.include? ">knowhow"
      if m.body.include? ">bot" then
#          p m.body
	  p bourbon()
      elsif m.body.include? ">knowhow" then
	  p knowhowInfo()
#      elsif m.user != "byun_bot" 
#	  puts Time.now
#	  puts "last_time=" + last_time.to_s
#	  puts "last_id=" + last_id.to_s
#	  p m

      end
      last_id = m.id
   end
  end

  end
  sleep 1
end
