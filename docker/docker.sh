#!/bin/bash
# Проверка наличия аргументов (имя стека и advertise-addr)
if [ $# -ne 2 ]; then
  echo "На вход узкадать желаемое имя службы, и ай-пи сетевой карты, через которую будем коннектиться по ssh"
  echo "Пример: $0 strogino 192.168.1.123"
  exit 1
fi

# Имя стека передается в аргументе $1
stack_name="$1"

# Адрес advertise передается в аргументе $2
advertise_addr="$2"

# Перейдем в каталог с Docker Compose файлом
cd "$(dirname "$0")/../docker/"

docker build -t strogino:ssh -f Dockerfile .

# Инициализируем Docker Swarm с указанным advertise-addr (если еще не инициализирован)
if ! docker info | grep -q "Swarm: active"; then
    docker swarm init --advertise-addr "$advertise_addr"
fi

# Развертываем службы из docker-compose.yml с указанным именем стека
docker stack deploy -c docker-compose.yml "$stack_name"

echo "Служба '$stack_name' была развернута в Docker Swarm и настроена."
echo "Для соединение с контейнером используете пароль Test123 и root@$2 -p 222"
echo "После входа в контейнер по ssh запустить данный скрипт cd /root/zoo && ./start.sh"
read -p "Нажми Enter для возврата"

