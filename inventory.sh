#!/bin/bash

# Ubuntu

y=$(cat /sys/block/sda/queue/rotational) 
DISK=$()

if [ $y -eq 0 ]; then DISK="SSD" 
else DISK="HDD"
fi

HOST=$(hostname)
USER=$(users)
UBUNTU_VER=$(cat /etc/issue.net)
CPU_NAME="$(cat /proc/cpuinfo | grep '^model name' | head -1 | sed 's/^.*:\s*//m') $(dmidecode --type 17 | grep -oPi "ddr\d")"
MEM_TOTAL="$(cat /proc/meminfo | grep '^MemTotal' | awk '{print $2}')"

echo $HOST $USER $UBUNTU_VER $CPU_NAME $MEM_TOTAL $DISK
