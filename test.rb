# encoding: utf-8

#require 'google/api_client'
#require "yaml"
require "time"

require 'rubygems'
require 'skype'

# 時間を格納
now=Time.now
time_min = Time.utc(now.year, now.month, now.day, 0).iso8601
time_max = Time.utc(now.year, now.month, now.day+2, 0).iso8601

p now
p now+(60*60*24)

        Skype.config :app_name => "byun_bot"

        Skype.chats.each do |chat|
		p chat
        end
