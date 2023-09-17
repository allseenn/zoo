REPONAME=$(basename "$PWD")
COLLABNAME=$1
TITLE=$1
BODY=$2


if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ] || [ "$*" == "" ]; then
    echo "Формат ввода: pull.sh 'title' 'body' [username]"
    exit 1;
fi

if [ $# -ge 3 ]; then
    USERNAME=$3
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -L -X POST \
 -H "Accept: application/vnd.github+json" \
 -H "Authorization: Bearer $PAT" \
 -H "X-GitHub-Api-Version: 2022-11-28" \
 "https://api.github.com/repos/allseenn/$REPONAME/pulls" \
 -d "{\"title\":\"$TITLE\",\"body\":\"$BODY\",\"head\":\"dev\",\"base\":\"main\"}"


