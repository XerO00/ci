#!/bin/bash
rm -rf cd
git clone https://github.com/XerO00/cd.git
cd cd/
sed "s/tagVersion/$1/g" deployment > deployment.yaml
cat deployment.yaml
git add .
git commit -m "tag changed"
git push https://${GIT_USER_NAME}:${GIT_PWD}@github.com/XerO00/cd.git    
git status
