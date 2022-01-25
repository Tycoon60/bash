#!/bin/bash

#Проверяем температуру сервера centos и отправляем в телеграм при привышении.
#apt-get install lm-sensors

senc=$(sensors | grep "Package id 0:" | awk '{print $4}' | awk '{print int($1+0.5)}')

#echo $senc

if [ ${senc} -gt 25 ] ; then
	curl -s -X POST https://api.telegram.org/bot1492809911:My_Token/sendMessage -F chat_id='-427379370' -F text="Проверить кондиционер"
fi
