#!/bin/bash
echo "3. Задание: Подключить дополнительный репозиторий MySQL. Установить любой пакет из этого репозитория"
sleep 2

apt update
apt -y install gnupg
apt-key adv --keyserver pgp.mit.edu --recv-keys 467B942D3A79BD29
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/mysql.gpg
echo "deb http://repo.mysql.com/apt/ubuntu/ jammy mysql-8.0" >> /etc/apt/sources.list

echo "Репозиторий mysql от компании oracle прописан в систему"
echo "Установка mysql-server..."
sleep 2

apt update
export DEBIAN_FRONTEND=noninteractive
apt -y install mysql-server
cat << EOF >> /etc/mysql/conf.d/mysql.cnf
[mysqld]
user=root
EOF
/usr/sbin/mysqld -D

echo "mysql-server установлен и запущен в режиме демона"


