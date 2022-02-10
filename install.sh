#!/bin/bash


root_pass="123"

apt update && apt upgrade -y && apt install -y mc ssh chromium-browser gnome-tweaks cups-pdf
snap install skype --classic

# Включить пользователя root
echo "${root_pass}\n${root_pass}\n" | passwd root

# Логин root по ssh
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

service ssh restart
dpkg -i /tmp/nomachine_7.4.1_1_amd64.deb

systemctl stop cups-browsed && systemctl disable cups-browsed
