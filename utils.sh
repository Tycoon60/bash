#!/bin/bash

user="root"
pass="123"

echo "-----------------------------------\n""1-kassa01" " |" "2-kassa02" " |" "3-kassaOOK" "|" "4-kassa Оборкина\n""5-kassa02r" "|" "6-kassa03r" "|" "7-kassaOOKR\n""8-kassaChelsi" "|" "9-kassaChelsiOOK\n""-----------------------------------\n""10-kill Документы" "|" "11-kill Отчёты\n""12-tail" "|" "13-add printer" "|" "14-отметка" "|" "15-отметить себя\n""-----------------------------------\n""Введите номер задачи:"
read y

link=$(pwd)

connect(){
tmp_file=$(sshpass -p ${pass} ssh -q -o StrictHostKeyChecking=no ${user}@${ip} mktemp)
sshpass -p ${pass} scp -q $(dirname $(readlink -f $0))/connect.sh "$user@$ip:$tmp_file"
sshpass -p ${pass} ssh -q $user@$ip "/bin/bash $tmp_file"
}

pc(){
echo "Введите имя компьютера:"
read ip
}

if [ $y -eq 1 ]; then
        ping 192.168.240.235
elif [ $y -eq 2 ]; then
        ping 192.168.240.246
elif [ $y -eq 3 ]; then
        ping 192.168.240.243
elif [ $y -eq 4 ]; then
        ping 192.168.240.242
elif [ $y -eq 5 ]; then
        ping 192.168.240.227
elif [ $y -eq 6 ]; then
        ping 192.168.240.230
elif [ $y -eq 7 ]; then
        ping 192.168.240.229
elif [ $y -eq 8 ]; then
        ping 192.168.240.49
elif [ $y -eq 9 ]; then
        ping 192.168.240.54
elif [ $y -eq 10 ]; then
        pc
        echo "kill -9 \$(ps aux | grep 1cv8 | grep 'Документы' | awk '{print \$2}')" > $link/connect.sh
        connect
elif [ $y -eq 11 ]; then
        pc
        echo "kill -9 \$(ps aux | grep 1cv8 | grep 'Отчеты' | awk '{print \$2}')" > $link/connect.sh
        connect
elif [ $y -eq 12 ]; then
        pc
        sshpass -p ${pass} ssh ${user}@${ip} tail -f /tmp/saturn_startup.log
elif [ $y -eq 13 ]; then
        pc
        sshpass -p ${pass} ssh ${user}@${ip} /data/chel_system/scripts/addprn.sh
elif [ $y -eq 14 ]; then
        echo "Введите номер карты:"
        read marine
        ip="time-uchet01"
        z=`echo $marine | sed -e 's/\(.\)/\1 /g'`
        echo "export DISPLAY=:0\nsu time-uchet01 -c 'xdotool key $z KP_Enter'" > $link/connect.sh
        connect
elif [ $y -eq 15 ]; then
        ip="time-uchet01"
        z=`echo 0008560470 | sed -e 's/\(.\)/\1 /g'`
        echo "export DISPLAY=:0\nsu time-uchet01 -c 'xdotool key $z KP_Enter'" > $link/connect.sh
        connect       
else
    	echo "Ввели не правильное значение"
fi

