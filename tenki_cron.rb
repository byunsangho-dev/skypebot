#encoding: utf-8

require './skypebot/json.rb'

def tokyoTenki
json=get_json('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')

if json != nil then
	if json.length > 0 then
		open("skypebot/tenki-tokyo.json", "w") do |io|
			JSON.dump(json, io)
		end
	end
end
end

tokyoTenki()

