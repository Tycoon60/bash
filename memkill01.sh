#!/bin/bash

#Если процесс потребил больше 40% от всей оперативки, то убить этот процесс и записать лог в tmp.

sleep 150

while :
do

sleep 10

filter01=$(ps -eo pid,%mem --sort=-%mem | head -2 | awk '/2/')
filter02=`(echo $filter01 | awk '{print $2}'| awk '{print int($1+0.5)}')`
filter03=`(echo $filter01 | awk '{print $1}')`

if [ ${filter02} -gt 40 ] ; then
        kill -9 $filter03
        echo $(date '+%Y-%m-%d %H:%M:%S') "process > 60%, kill" >> /tmp/check.log
fi
done
