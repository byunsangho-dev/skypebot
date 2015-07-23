# encoding: utf-8

require 'rubygems'
require 'skype'

require 'net/http'
require 'uri'
require 'json'

	Skype.config :app_name => "byun_bot"

	Skype.chats.each do |chat|
		if chat.id == "#byun.sangho/$byun_bot;e0e383662742a91f"
		end
		p chat
    end

