REPONAME=$(basename "$PWD")
ISSUE=$1

if [ $# -eq 0 ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ]|| [ "$1" == "h" ]; then
    echo "Формат ввода: issue_close.sh issue_number [username]"
    exit 1;
fi

if [ $# -ge 2 ]; then
    USERNAME=$2
    PAT=$(cat ~/.git-credentials | grep "$USERNAME" | awk -F":" '{ print $3}' | sed 's/@github.com//')
else
    PAT=$(cat ~/.git-credentials | awk -F":" '{ print $3}' | sed 's/@github.com//')
    USERNAME=$(cat ~/.git-credentials | awk -F":" '{ print $2}' | sed  's/\///g')
fi

curl -X POST \
 -H "Accept: application/vnd.github+json" \
 -H "Authorization: Bearer $PAT" \
https://api.github.com/repos/allseenn/$REPONAME/issues/$ISSUE \
 -d '{"state":"closed"}'