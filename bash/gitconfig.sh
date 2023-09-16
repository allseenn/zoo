#!/bin/bash

# Запрос данных от пользователя
read -p "Введите ваше имя пользователя Git: " git_username
read -p "Введите вашу электронную почту Git: " git_email
read -p "Введите ваш токен GitHub: " github_token

# Создание .gitconfig
cat << EOF > ~/gitconfig
[user]
    name = $git_username
    email = $git_email
[core]
    editor = vim --nofork
[safe]
    directory = /root/zoo
[credential]
    helper = store
EOF

# Создание .git-credentials
echo "https://$git_username:$github_token@github.com" >> ~/git-credentials

# Сообщение о завершении
echo "Конфигурация Git и учетные данные успешно сохранены."

