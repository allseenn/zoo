#!/bin/bash
echo "3. Задание: Подключить дополнительный репозиторий MySQL. Установить любой пакет из этого репозитория"
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/mysql.gpg
echo "deb http://repo.mysql.com/apt/ubuntu/ jammy mysql-8.0" >> /etc/apt/sources.list

echo "Репозиторий repo.MySql.com от компании oracle прописан в систему"
echo "Установка mysql-server..."
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2

apt update
export DEBIAN_FRONTEND=noninteractive
apt -y install mysql-server
cat << EOF > /etc/mysql/conf.d/mysql.cnf
[client]
user=root
password=Test123
[mysqld]
user=root
skip-grant-tables
EOF

chmod 600 /etc/mysql/conf.d/mysql.cnf
/usr/sbin/mysqld -D

echo "mysql-server установлен и запущен в режиме демона"
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2

