REPONAME=$(basename "$PWD")
BODY=$1
PULL=$2

if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: pull_comment.sh 'body' [pull_number] [username]"
    exit 1;
fi

if [ $# -ge 3 ]; then
    USERNAME=$3
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
    PULL="2"
fi

curl -L -X POST \
-H "Accept: application/vnd.github.v3+json" \
-H "Authorization: Bearer $PAT" \
-H "X-GitHub-Api-Version: 2022-11-28" \
-d "{\"body\":\"$BODY\"}" \
"https://api.github.com/repos/allseenn/$REPONAME/issues/$PULL/comments"
