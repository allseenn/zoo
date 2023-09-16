#!/bin/bash

# Проверка наличия аргумента (имя стека)
if [ $# -ne 1 ]; then
  echo "Использование: $0 <имя_стека>"
  exit 1
fi

# Имя стека передается в аргументе $1
stack_name="$1"

# Перейдем в каталог с Docker Compose файлом
cd "$(dirname "$0")/../docker"

# Инициализируем Docker Swarm (если еще не инициализирован)
if ! docker info | grep -q "Swarm: active"; then
    docker swarm init
fi

# Развертываем службы из docker-compose.yml с указанным именем стека
docker stack deploy -c docker-compose.yml "$stack_name"

# Добавляем службу с указанным именем стека в автозагрузку
docker service update --autolock=true --restart-window=0 --restart-condition=on-failure "$stack_name"

echo "Служба '$stack_name' была развернута в Docker Swarm и добавлена в автозагрузку."
