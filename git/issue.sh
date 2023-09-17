REPONAME=$(basename "$PWD")
COLLABNAME=$1
TITLE=$2
BODY=$3


if [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ] || [ "$*" == "" ]; then
    echo "Формат ввода: issue.sh collaborator 'title' 'body' [username]"
    exit 1;
fi

if [ $# -ge 3 ]; then
    USERNAME=$4
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -X POST \
 -H "Accept: application/vnd.github+json" \
 -H "Authorization: Bearer $PAT" \
 "https://api.github.com/repos/allseenn/$REPONAME/issues" \
-d "{\"title\":\"$TITLE\",\"body\":\"$BODY\",\"assignee\":\"$COLLABNAME\"}"

