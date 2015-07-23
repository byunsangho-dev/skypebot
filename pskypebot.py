# encoding: utf-8
# -*- coding: utf-8 -*-

import Skype4Py
import time
import json
import random
import sys,codecs
reload(sys)
sys.setdefaultencoding('utf-8')

def bourbon():
	f=open('bourbon.json', 'r')
	jsonData=json.load(f)
	f.close()
	index=random.randint(0, len(jsonData)-1)
	return jsonData[index]

def tenki():
	f=open('tenki-tokyo.json', 'r')
	jsonData=json.load(f)
	f.close()
	return jsonData

def handler(msg, event):
	sys.stdout = codecs.getwriter('utf-8') (sys.stdout)
	f=open('pskypebot_msg.log','a')
	print >> f, time.ctime()
	print >> f, "event=" + event
	print >> f, u"msg=" + msg.Body
	f.close()

	if event == u"RECEIVED":
		if msg.Body.startswith(">bot"):
			msg.Chat.SendMessage(bourbon())
		elif msg.Body == ">tenki":
			data=tenki()
			msg.Chat.SendMessage(data["title"])
			msg.Chat.SendMessage(data["description"]["text"])

def main():
	skype = Skype4Py.Skype(Transport='x11')
	skype.OnMessageStatus = handler
	skype.Attach()

	while True:
		time.sleep(1) 

if __name__ == "__main__":
	main()
