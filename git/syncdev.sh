#!/bin/bash
# Скрипт обновляет ветку dev до последнего состояния ветки main
git checkout main
git pull
git checkout dev
git merge main
git push origin branchName
