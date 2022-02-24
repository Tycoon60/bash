#!/bin/bash

sleep 150

while :
do

sleep 3

filter01=$(ps -eo pid,%mem --sort=-%mem | head -2 | awk '/2/')
filter02=`(echo $filter01 | awk '{print $2}'| awk '{print int($1+0.5)}')`
filter03=`(echo $filter01 | awk '{print $1}')`

if [ ${filter02} -gt 50 ] ; then
        kill -9 $filter03
        echo $(date '+%Y-%m-%d %H:%M:%S') "process > 60%, kill" >> /tmp/check.log
fi

filter11=$(ps -eo pid,%cpu --sort=-%cpu | head -2 | awk '/2/')
filter12=`(echo $filter11 | awk '{print $2}'| awk '{print int($1+0.5)}')`
filter13=`(echo $filter11 | awk '{print $1}')`

if [ ${filter12} -gt 90 ] ; then
        kill $filter13
        echo $(date '+%Y-%m-%d %H:%M:%S') "process > 90%, kill" >> /tmp/check.log
fi



done
