#!/bin/bash
echo "Добро пожаловать, это старттоый скрипт, выполняющий итоговую контрольную работу.
Вся работа сделана в docker установленном на Ubunte, для его установки выбери пункт 0.
В варианте с докером  скрипт нужно запускать зайдя в контейнер cd ~/zoo && ./start.sh.
Пункт 1. Если хотите исполнять скрипт на реальной убунте, требуется установка доп. ПО.
Пункт 2. Заускает выполнение всех заданий в автоматичесокм режиме с таймаутом 2-5 сек.
Пункт 3. Запуск всех заданий, но в конце каждого из них требует нажать  клавишу Enter.
Пункт 4. README.md  рекомендуется к прочтению перед запуском пунтка 1 или 2 программы.
Пункт 5. Завершение работы данного скрипта. Вся работа сохраяется на диске, папка zoo."

while true; do
    clear
    echo "0. Удалить старый и поставить новый docker, а также развернуть в нем настроенную среду. "
    echo "1. Установка необходимого По на ubuntu на реальном железе либо vbox, vmware, hyper-v, etc." 
    echo "2. Выполение заданий в автоматическом режиме"
    echo "3. Выполение заданий, с продолжением по Enter"
    echo "4. Открыть инструкцию с описанием и пояснениями"
    echo "5. Завершить работу скрипта"
  
    read -p "Выберите опцию: " option
    case $option in
        0)  clear && echo "Проверка и установка програмного обеспечения..." && sleep 3
        for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done    
	sudo apt-get update
	sudo apt-get -y install ca-certificates curl gnupg
	sudo install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	sudo chmod a+r /etc/apt/keyrings/docker.gpg
	# Add the repository to Apt sources:
	echo \
  	"deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  	"$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	./docker/docker.sh
            clear
	    ;;
        1)  clear && echo "Начинаю устанавлить набор программ и утилит..." && sleep 3
            sudo apt-get install -y vim git curl wget python3.10-venv gnupg locales default-jdk file tree graphviz
	    clear && echo "Клонирую репозиторий с контрольной работой..." && sleep 3
	    git clone https://github.com/allseenn/zoo.git
	    cd zoo
	    clear && echo "Установка закончена, приступайте к запуску контрольной (Пункт 2 ли 3 меню)..." && sleep 4
	    ./start.sh &
	    exit
            ;;
	2)  clear && echo "Начинаю выполнять задания в авторежиме..." && sleep 3
            ./bash/pets.sh
	    ./mysql/mysql_setup.sh
	    ./bash/dpkg.sh
	    ./python/python.sh
	    ./mysql/mysql_base.sh
	    ./class/create.sh
	    ./class/app.sh
            ;;
	    clear
        3)  clear && echo "Выполнение в ручном режиме с Enter..." && sleep 3
            ./bash/pets.sh 1
	    ./mysql/mysql_setup.sh 1
	    ./bash/dpkg.sh 1
	    ./python/python.sh 1
	    ./mysql/mysql_base.sh 1
	    ./class/create.sh 1
	    ./class/app.sh 1
            ;;
        4)  clear
            less README.md
            ;;
        5)  break
            ;;
        *)  echo "Неверный выбор. Пожалуйста, попробуйте снова.";;
    esac
done
