#!/bin/bash

# Проверка наличия аргументов (имя стека и advertise-addr)
if [ $# -ne 2 ]; then
  echo "Использование: $0 <имя_стека> <advertise-addr>"
  exit 1
fi

# Имя стека передается в аргументе $1
stack_name="$1"

# Адрес advertise передается в аргументе $2
advertise_addr="$2"

# Перейдем в каталог с Docker Compose файлом
cd "$(dirname "$0")/../docker"

# Инициализируем Docker Swarm с указанным advertise-addr (если еще не инициализирован)
if ! docker info | grep -q "Swarm: active"; then
    docker swarm init --advertise-addr "$advertise_addr"
fi

# Развертываем службы из docker-compose.yml с указанным именем стека
docker stack deploy -c docker-compose.yml "$stack_name"

# Добавляем службу с указанным именем стека в автозагрузку
docker service update --autolock=true --restart-window=0 --restart-condition=on-failure "$stack_name"

echo "Служба '$stack_name' была развернута в Docker Swarm и добавлена в автозагрузку."
