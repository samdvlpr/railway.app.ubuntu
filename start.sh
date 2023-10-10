#!/bin/bash

echo -n "$Username:$Password"

apt-get update && apt-get upgrade sudo -y

apt-get install -y openssh-server

mkdir /var/run/sshd

echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

sudo useradd -s /bin/bash -d /home/$Username/ -m -G sudo $Username

echo -n "$Username:$Password" | sudo chpasswd

sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ssh-keygen -A

exec /usr/sbin/sshd -D -e "$@"
