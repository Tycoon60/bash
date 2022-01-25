#!/bin/sh

#Установка ssh ключей на машины

ip="172.26.0.24 172.26.0.25 172.26.0.23"
user="root"

for ip in $ip
do
sshpass -p Password ssh-copy-id ${user}@${ip}
done
