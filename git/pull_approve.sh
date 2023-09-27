#!/bin/bash
REPONAME=$(basename "$PWD")
PULL=$1

if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: pull_approve.sh pull_number [username]"
    exit 1;
fi

if [ $# -ge 2 ]; then
    USERNAME=$2
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -L -X POST \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: Bearer $PAT" \
-H "X-GitHub-Api-Version: 2022-11-28" \
-d '{"event": "APPROVE"}' \
"https://api.github.com/repos/allseenn/$REPONAME/pulls/$PULL/reviews"
