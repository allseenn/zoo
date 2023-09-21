#!/bin/bash
echo "4.Задание: Установить и удалить deb-пакет с помощью dpkg."
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2

wget "http://archive.ubuntu.com/ubuntu/pool/universe/c/cowsay/cowsay_3.03+dfsg2-8_all.deb"
wget "http://archive.ubuntu.com/ubuntu/pool/main/libt/libtext-charwidth-perl/libtext-charwidth-perl_0.04-10build3_amd64.deb"
dpkg -i ./libtext*.deb
dpkg -i ./cowsay*.deb
cowsay "GeekBrains"

echo "Удаляем приложение cowsay"
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2
dpkg -r cowsay
dpkg -r libtext-charwidth-perl
rm *.deb

echo "Удалена cowsay"
echo "5.Задание: Выводим историю"
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2

history
[ "$1" == "1" ] && (read -p "Нажмите Enter для продолжения") || sleep 2


