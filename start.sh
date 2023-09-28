#!/bin/bash
clear
echo "	КРАТКОЕ ОПИСАНИЕ:"
echo "Добро пожаловать, это стартовый скрипт, выполняющий итоговую контрольную работу.
Пункт 1. Чтобы не захламлять систему рекомендуется установить версию docker старше 23.
Пункт 2. Развернет необходимую среду и соберет нужный образ с пакетами docker-compose.
Подключаемся к контейнеру root@localhost -p222  пароль Test123 cd ~/zoo && ./start.sh.
Пункт 3. Автоматическое подключение к уже развернотому docker-контейнеру, если  обрыв.
Пункт 4. Если хотите исполнять скрипт на реальной убунте, требуется установка доп. ПО.
Пункт 5. Запускает выполнение всех заданий в автоматичесокм режиме таймаут 2 - 5 секу.
Пункт 6. Запуск всех заданий, но в конце каждого из них требует нажать  клавишу Enter.
Пункт 7. README.md  рекомендуется к прочтению перед запуском пунтка 5 или 6 программы.
Пункт 8. Завершение работы данного скрипта. Вся работа сохраяется на диске, папка zoo."
echo
while true; do
    echo "	ГЛАВНОЕ МЕНЮ:"
    echo "1. Удалить старый и поставить новый docker"
    echo "2. Развернуть контейнер и среду (для докер версии >= 24)"
    echo "3. Автоподключение к развернотому контейнеру"
    echo "4. Установка ПО для Ubuntu на реальном ПК либо виртуальной машине." 
    echo "5. Выполение заданий в автоматическом режиме"
    echo "6. Выполение заданий, с продолжением по Enter"
    echo "7. Подробная инструкцию (нажать q для возврата из инструкции)"
    echo "8. Завершить работу скрипта"
  
    read -p "Выберите опцию: " option
    case $option in
        1)  clear && echo "Проверка и установка програмного обеспечения..." && sleep 3
            for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done    
	    sudo apt-get update
	    sudo apt-get -y install ca-certificates curl gnupg sshpass
	    sudo install -m 0755 -d /etc/apt/keyrings
	    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	    sudo chmod a+r /etc/apt/keyrings/docker.gpg
	    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  	    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	    sudo apt-get update
	    sudo apt-get -y install git docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	    clear && echo "Настройка и запуск контейнера docker..." && sleep 2
	    ;;
	2)  clear && echo "Докер установлен! Выберите пункт 2.Развернуть контейнер..." && sleep 2
	    cd
	    rm -rf mysql
	    git clone https://github.com/allseenn/zoo.git
	    cd zoo
            rm -rf pets/
	    read -p "Введите любое английсоке название службы (например, strogino): "  NAME
	    read -p "Введите ip адрес вашей реальной сетевой карты (можно, 127.0.0.1): " IP
	    ./docker/docker.sh $NAME $IP
	    sleep 3
	    mkdir ~/mysql
	    systemctl restart docker
	    sleep 7
	    sshpass -pTest123 ssh root@localhost -p 222 -o StrictHostKeyChecking=no
	    ;;
    	3)  clear && echo "Подключение к развернотому контейнеру"
	    sshpass -pTest123 ssh root@localhost -p 222 -o StrictHostKeyChecking=no
	    ;;
        4)  clear && echo "Начинаю устанавлить набор программ и утилит..." && sleep 3
            sudo apt-get install -y vim git curl wget python3.10-venv gnupg locales default-jdk file tree graphviz sshpass
	    clear && echo "Клонирую репозиторий с контрольной работой..." && sleep 3
	    cd
	    git clone https://github.com/allseenn/zoo.git
	    cd zoo
	    rm -rf pets/
	    clear && echo "Установка закончена, приступайте к запуску контрольной (Пункт 5 или 6 меню)..." && sleep 4
	    ./start.sh &
	    exit
    	5)  clear && echo "Начинаю выполнять задания в авторежиме..." && sleep 3
            cd 
	    git clone https://github.com/allseenn/zoo.git
	    cd zoo
	    ./bash/pets.sh
	    ./mysql/mysql_setup.sh
	    ./bash/dpkg.sh
	    ./python/python.sh
	    ./mysql/mysql_base.sh
	    ./class/create.sh
	    ./class/app.sh
	    clear
            ;;
        6)  clear && echo "Выполнение в ручном режиме с Enter..." && sleep 3
            ./bash/pets.sh 1
	    ./mysql/mysql_setup.sh 1
	    ./bash/dpkg.sh 1
	    ./python/python.sh 1
	    ./mysql/mysql_base.sh 1
	    ./class/create.sh 1
	    ./class/app.sh 1
            ;;
        7)  clear
            less README.md
            ;;
        8)  break
            ;;
        *)  clear && echo "Неверный выбор. Пожалуйста, попробуйте снова."
	    echo
	    ;;
    esac
done
