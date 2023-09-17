REPONAME=$(basename "$PWD")
BODY=$1
ISSUE=$2

if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: issue_comment.sh 'body' [issue_number] [username]"
    exit 1;
fi

if [ $# -ge 3 ]; then
    USERNAME=$3
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -X POST \
 -H "Accept: application/vnd.github.v3+json" \
 -H "Authorization: Bearer $PAT" \
 "https://api.github.com/repos/allseenn/$REPONAME/issues/$ISSUE/comments" \
 -d "{\"body\":\"$BODY\"}"
