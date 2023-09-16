# Итоговая контрольная работа

Выполняется в конце основной специализации перед выбором технологической, в рамках программы обучения "Разработчик" онлайн университета [GeekBrains](https://gb.ru)

Студент группы 4992

Ромашин Ростислав

## Описание

**ВАЖНО**: Данный файл содержит раздел Инструкция, который описывает как запустить и работать с программами, полученными в результате итоговой работы, а так же описание процесса выполнения данного проекта.

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
./bash/create.sh zoo
```
Далее тимлид приглашает разработчика в команду запустив скрипт из локальной репы

```
./bash/invite.sh strogino
```
После поднятия убунты в докере ей будет управлять strogino, который будет принимать и отправлять пулл-request

## docker

Вся работа будет выполнятся в среде Ubuntu 22.04, на которую разверну инфраструктуру докер с той же убунтой, чтобы не захламлять реальную систему, в том числе и возможно вирусными репозиториями.

Для того чтобы контейнер стартовал вместе с включением машины, а так же для возможного масштабирования, воспользуюсь docker swarm

Для развертывания среды используем файл docker-compose.yml, а для возможности подключения к виртуальной убунте, установим ssh-сервер в образ c помощью Dockerfile

Все конфигурационные файлы для развертывания находятся в папке docker, т.к. будут проброшены две папки в виртуальную машину, необходимо перейти в желаемое место на любой физической машине под управлением убунты и выполнить каманду

```
cd
git clone https://github.com/allseenn/zoo.git
./zoo/bash/docker.sh
```
После развертывания контейнера в среде docker swarm можно подключиться к нему по ssh c паролем root: Test123
Т.к. у нас проброшена папка репозитория внутрь контейнера то мы можем вносить изменения от имени разработчика strogino и создавать пулл-реквесты.

## ubuntu разработчика
Подключаемся по ssh на проброшенный реальный порт 222 к контейнеру докер.

Для работы с гит-репозиторием необходимо создать в ЛК гитхаба токен [нового образца](https://github.com/settings/tokens?type=beta) или [старого](https://github.com/settings/tokens/new). Т.к. разработчик обладает ограниченным набором прав в качестве колобаранта, без доступа к основной ветке создадим ветку dev, но для начала сохраним токен в конфиге.
```
echo "git_token_sdfsdfsdfsd" > ~/.git-credentials
```
установим набор утилит для работы с файлами и гитом

```
apt update
apt install git vim
```