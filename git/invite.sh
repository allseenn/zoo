#!/bin/bash
# Скрипт приглашения юзера в команду по работе на данных репозиторием (pwd)

REPONAME=$(basename "$PWD")
COLLABNAME=$1

if [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ] || [ "$*" == "" ]; then
    echo "Формат ввода: invite.sh collaborator [username]"
    exit 1;
fi

if [ $# -ge 2 ]; then
    USERNAME=$2
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi


# Добавление пользователя как коллаборатора с разрешением на запись
curl -X PUT \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $PAT" \
"https://api.github.com/repos/$USERNAME/$REPONAME/collaborators/$COLLABNAME" \
-d '{"permission":"write"}'

# Настройка защиты ветки "main"
curl -L -X PUT \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $PAT" \
"https://api.github.com/repos/$USERNAME/$REPONAME/branches/main/protection" \
-H "X-GitHub-Api-Version: 2022-11-28" \
-d '{"required_status_checks":null,"enforce_admins":null,"required_pull_request_reviews":{"required_approving_review_count":1},"restrictions":null}'

