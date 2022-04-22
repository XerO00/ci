#!/bin/bash
git clone https://github.com/XerO00/cd.git
sed "s/tagVersion/$1/g" tdeployment > deployment.yaml
cat deployment.yaml
git add .
git commit -m "tag changed ${TAG}"
git push https://${GIT_USER_NAME}:${GIT_PWD}@github.com/XerO00/cd.git
