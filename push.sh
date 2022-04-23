#!/bin/bash
rm -rf cd
git clone https://github.com/XerO00/cd.git
cd cd/
sed "/^\([[:space:]]*tag: \).*/s//\1${TAG}/g" -i /helm/chart/values.yaml
git add .
git commit -m "tag version updated"
git push https://${GIT_USER_NAME}:${GIT_PWD}@github.com/XerO00/cd.git
git status
