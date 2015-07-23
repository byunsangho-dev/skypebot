# encoding: utf-8

require 'google/api_client'
require "yaml"
require "time"

require 'rubygems'
require 'skype'

Skype.config :app_name => "byun_bot"

# Initialize OAuth 2.0 client
# authorization
oauth_yaml = YAML.load_file('.google-api.yaml')
client = Google::APIClient.new({:application_name => "google calendar noti",:application_version => "1.0"})
client.authorization.client_id = oauth_yaml["client_id"]
client.authorization.client_secret = oauth_yaml["client_secret"]
client.authorization.scope = oauth_yaml["scope"]
client.authorization.refresh_token = oauth_yaml["refresh_token"]
client.authorization.access_token = oauth_yaml["access_token"]

cal = client.discovered_api('calendar', 'v3')

# イベント取得月の確認
#printf("カレンダーを表示する年(20XX)：")
#year = gets.strip.to_i
#printf("カレンダーを表示する月(1-12)：")
#month = gets.strip.to_i

# 時間を格納
now=Time.now
time_min = Time.utc(now.year, now.month, now.day, 0).iso8601
tommorow=now + (60*60*24)
time_max = Time.utc(tommorow.year, tommorow.month, tommorow.day, 0).iso8601

# イベントの取得
params = {'calendarId' => 'primary',
          'orderBy' => 'startTime',
          'timeMax' => time_max,
          'timeMin' => time_min,
          'singleEvents' => 'True'}

result = client.execute(:api_method => cal.events.list,
                        :parameters => params)

# イベントの格納
events = []
result.data.items.each do |item|
        events << item
end

# 出力
events.each do |event|
    printf("%s,%s (from B君's goolge calendar)\n",event.start.dateTime,event.summary)
	Skype.chats.each do |chat|
		unless chat.id == "#ca_tanaka_h/$ca_kawakami;1ebdba626ab38eb5"
#		if chat.id == "#byun.sangho/$byun_bot;1db4ff26fa0b81df"
			chat.post event.start.dateTime.to_s << " " << event.summary << " (from B君's goolge calendar)"
#    	end
#		p chat.id
		end
	end
end


