#/usr/bin/env ruby

require './skypebot/json.rb'
def bourbon
json=get_json('https://trello.com/1/boards/5317ef8011091a536d696d11/cards?key=4cc2e1f27badea43a162a22c4750b8d4&token=f063f2fe259173fad6d44b606abb71504636d12c9ade675af752c1903d853bbe')
name=json.map { |hash| hash["name"] }
#l=name.length
#i=rand(l -1)
#name[i]
end

data=bourbon()
if data.length > 0 then
  open("skypebot/bourbon.json", "w") do |io|
    JSON.dump(bourbon(), io)
  end
end

#p bourbon()


