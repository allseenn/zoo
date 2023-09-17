REPONAME=$(basename "$PWD")

if [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: issue_read.sh [username]"
    exit 1;
fi

if [ $# -ge 1 ]; then
    USERNAME=$1
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -X GET \
 -H "Accept: application/vnd.github+json" \
 -H "Authorization: Bearer $PAT" \
 "https://api.github.com/repos/allseenn/$REPONAME/issues" \
 -d "{\"state\":\"open\",\"assignee\":\"$USERNAME\"}"