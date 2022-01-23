#!/bin/sh

echo "script check_net start" > /tmp/check.log
sleep 5
while true
    do
        if [ ! -f "/tmp/saturn_startup.log" ] ; then 
            service autofs restart
            sleep 1
            ls /data/chel_system
            sh /data/chel_system/sysinit.sh 
            echo "script check_net done" >> /tmp/check.log
    else
            echo "Файл saturn_startup.log существует " >> /tmp/check.log
            echo "script check_net done" >> /tmp/check.log
            break
        fi
done
