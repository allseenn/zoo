REPONAME=$(basename "$PWD")
TITLE=$1
BODY=$2
PULL="$3"

if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: pull_merge.sh 'title' 'body' pull_number [username]"
    exit 1;
fi

if [ $# -ge 4 ]; then
    USERNAME=$4
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
    PULL="2"
fi

curl -L -X PUT \
 -H "Accept: application/vnd.github+json" \
 -H "Authorization: Bearer $PAT" \
 -H "X-GitHub-Api-Version: 2022-11-28" \
 https://api.github.com/repos/allseenn/$REPONAME/pulls/$PULL/merge \
 -d "{\"commit_title\":\"$TITLE\",\"commit_message\":\"$BODY\",\"merge_method\":\"merge\"}"
