# encoding: utf-8

require 'rubygems'
require 'skype'

Skype.config :app_name => "byun_bot" 

Skype.chats.each do |chat|
	p chat
#	if chat.id == "#byun.sangho/$byun_bot;e0e383662742a91f" then
#		chat.post "ping"
#	end


end


