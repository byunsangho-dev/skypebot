#encoding: utf-8

require './json.rb'

def knowhowCards
  json = open('knowhow-cards.json') do |io|
    JSON.load(io)
  end
end


def knowhowLists
  json = open('knowhow-lists.json') do |io|
    JSON.load(io)
  end
end

# TODO delete
def deviceinfo
  knowhowInfo()
end

def knowhowInfo
  cards=knowhowCards()
  list=knowhowLists()
  text="「ノウハウ蓄積作業坂」の状況 \n"
  for data in list do
    c=cards.select { |hash| hash["idList"] == data["id"] }
    text = text + data["name"].to_s + ":" + c.length.to_s + "件"+ "\n"
  end
  text
end


