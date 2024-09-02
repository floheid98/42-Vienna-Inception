#!/bin/bash

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

mkdir -p /var/www/html
mkdir -p /var/run/vsftpd/empty

chown $FTP_USER:$FTP_USER /var/www/html

if (/usr/sbin/vsftpd) then
    echo "ALAAAAAAAAAAAAAARM"
fi