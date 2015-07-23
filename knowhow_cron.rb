#encoding: utf-8

require './skypebot/json.rb'

def knowhowCards
json=get_json('https://trello.com/1/boards/542935bae404ff678158479e/cards?key=4cc2e1f27badea43a162a22c4750b8d4&token=f063f2fe259173fad6d44b606abb71504636d12c9ade675af752c1903d853bbe')

if json != nil then
	if json.length > 0 then
		open("skypebot/knowhow-cards.json", "w") do |io|
			JSON.dump(json, io)
		end
	end
end
end

def knowhowLists
json=get_json('https://trello.com/1/boards/542935bae404ff678158479e/lists?key=4cc2e1f27badea43a162a22c4750b8d4&token=f063f2fe259173fad6d44b606abb71504636d12c9ade675af752c1903d853bbe')

if json != nil then
	if json.length >0 then
		open("skypebot/knowhow-lists.json", "w") do |io|
			JSON.dump(json, io)
		end
	end
end
end

def bugDiff

end

knowhowCards()
knowhowLists()

