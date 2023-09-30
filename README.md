# Итоговая контрольная работа

Выполняется в конце основной специализации перед выбором технологической, в рамках программы обучения "Разработчик" онлайн университета [GeekBrains](https://gb.ru)

Студент группы 4992

Ромашин Ростислав

## Быстрый старт (Для ленивых)
Для запуска контрольной работы скопируйте команду ниже и вставьте в терминал убунты (реальной или виртуальной): 

```
wget https://github.com/allseenn/zoo/raw/main/start.sh -O start.sh && bash start.sh
```

## Введение
Данный репозиторий содержит вторую часть контрольной работы перед выбором техспециализации по программе "Разработчик" ООО "ГикБрейнс". Репозиторий в корневой директории содержит стартовый скрипт start.sh, при запуске которого, происходит магия - контрольная начинает сама выполняться, в режиме диалога. 

Необходимо иметь на борту вашего компьютера Ubuntu 20.04 - 23.10. Убунта может быть установлена в качестве основной системы или гостевой на VirtulaBox или Hyper-V. 

Стартовый скрипт start.sh позволяет в автоматическом режиме:
1. Установить движок docker из офрепозитория
2. Развернуть контейнер и всю необходимую инфраструктуру для запуска контрольной работы
3. Подключаться к контейнеру по ssh одним нажатием
4. Установить необходимое ПО на убунту, если вы желаете запустить контрольную без докера
5. Запустить исполнение контрольных заданий в автоматическом режиме
6. Запустить исполнение контрольных заданий в ручном режиме
7. Вывести на экран данное руководство
8. Завершить работу скрипта после проведенных заданий.


## Заключение

Работа над проектом выполнена в соответствии с [техническим заданием](https://gbcdn.mrgcdn.ru/uploads/asset/4868005/attachment/1f0bfdadc1c954fc748a4890b644e605.pdf), размещенным на основном портале университета.

Работа состоит из нескольких частей:

- создание git-репозиториев под данный проект: локального и удаленного
- организация инфраструктуры докер
- настройка виртуальной ситемы убунты дла разработчика strogino
- подключение необходимых репозиториев системы и установка пакетов
- создание bash-скрипта
- создание java-приложения
- создание переодических пулл-реквестов
- создание инструкции по использованию данного проекта в текущем файле (README.md).

## git-repo
для создания и управления пулл-реквестами заведу двух моих пользователей на github.com
- allseenn - teamlead
- strogino - develope

Для расширенного набора запросов к github API необходим [токен нового образца](https://github.com/settings/tokens?type=beta).
Тимлид создает локальную репу zoo и создает там любой контент, например описание или скелет будущего проекта
Тимлид создает репу zoo с помощью команды

```
mkdir zoo
cd zoo
./git/create.sh zoo
```
Далее тимлид приглашает разработчика в команду запустив скрипт из локальной репы

```
./git/invite.sh strogino
```
После поднятия убунты в докере ей будет управлять strogino, который будет принимать и отправлять пулл-request.
Поэтому, создадим конфигурационные файлы гита, которые будут проброшены в контейнер, в них введем по запросу данные гитхаба для разработчика

```
cd
git clone https://github.com/allseenn/zoo.git
./zoo/git/gitconfig.sh
```

## docker

Вся работа будет выполнятся в среде Ubuntu 22.04, на которую разверну инфраструктуру докер с той же убунтой, чтобы не захламлять реальную систему, в том числе и возможно вирусными репозиториями.

Для того чтобы контейнер стартовал вместе с включением машины, а так же для возможного масштабирования, воспользуюсь docker swarm

Для развертывания среды используем файл docker-compose.yml, а для возможности подключения к виртуальной убунте, установим ssh-сервер в образ c помощью Dockerfile, также встроим в образ первоначальный набор утилит таких как vim, curl, wget и git.

В контейнер с реальной машины будут проброшены папки: zoo, mysql и файл для авторизации с гитом от имени разработчика. Необходимо его создать в домашней директории и заполнить своими данными типа
```
echo "https://strogino:very_secret_token@github.com" >> ~/git-credentials
```
где very_secret_token наш токен сгенерированный в ЛК гитхаба
Создаем не скрытый файл без точки с названием на реальной машине, поэтому это не будет мешать работе существующему гиту.

Все конфигурационные файлы для развертывания находятся в папке docker, т.к. будут проброшены две папки в виртуальную машину, необходимо перейти в желаемое место (дамашняя директория) на любой физической машине под управлением убунты и выполнить каманду

```
cd
git clone https://github.com/allseenn/zoo.git
./zoo/docker/docker.sh
```
После развертывания контейнера в среде docker swarm можно подключиться к нему по ssh c паролем root: Test123
Т.к. у нас проброшена папка репозитория внутрь контейнера то мы можем вносить изменения от имени разработчика strogino и создавать пулл-реквесты.

## ubuntu разработчика
Подключаемся по ssh на проброшенный реальный порт 222 к контейнеру докер.

В домашнюю директорию проброшена папка zoo, перейдем в нее и запустим скрипт, который примет приглашение от тимлида

```
cd 
./zoo/git/accept.sh
```

так же создастся ветка для разаработки dev
