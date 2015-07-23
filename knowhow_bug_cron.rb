# encoding: utf-8

require 'rubygems'
require 'skype'

require 'net/http'
require 'uri'
require 'json'

json = open('skypebot/knowhow-cards.json') do |io|
	JSON.load(io)
end

olddata = open('skypebot/knowhow-bug-notice.json') do |io|
    JSON.load(io)
end

cards=json.select {|hash| hash["idList"] == "542935e29e17df0593198bbd" }
diff=cards.length() - olddata["oldValue"].to_i()

if diff >0 then
	Skype.config :app_name => "byun_bot"

	Skype.chats.each do |chat|
		if chat.id == "#ca_tanaka_h/$ca_kawakami;1ebdba626ab38eb5" then
			chat.post ("trelloに端末固有バグ：" + diff.to_s + " 件追加された模様！"  )
		end
	end
else
    diff=0
end

rcards=json.select {|d| d["idList"] == "542935f8b0ae78be89a713a1" }
#rdiff=rcards.length() - olddata["research"].length.to_i()

rdata=[]
rcards.each do |data|
	rdata.push data["name"] unless olddata["research"].include?(data["id"])
end
rdiff=rdata.length()


if rdiff >0 then
#	rdata=[]
#	rcards.each do |data|
#		rdata.push data["name"] unless olddata["research"].include?(data["id"])
#	end
	rdatastr = ""
	rdata.each do |data|
		rdatastr += data + " \n"
	end

    Skype.config :app_name => "byun_bot"

    Skype.chats.each do |chat|
		if chat.id == "#ca_tanaka_h/$ca_kawakami;1ebdba626ab38eb5" then
			chat.post ("trello : 端末固有バグ: 調査対象:" + rdata.length.to_s + "件 お願いします")
			chat.post (rdatastr )
    	end
	end
else
    rdiff=0
end

data = {
    :oldValue => cards.length.to_s,
    :newValue => diff.to_s,
	:research => rcards.map {|d| d["id"]},
	:researchLen => rcards.map {|h| h["id"]}.length.to_s
}

open("skypebot/knowhow-bug-notice.json", "w") do |io|
	JSON.dump(data, io)
end

