#!/bin/bash
rm -rf cd
git clone https://github.com/XerO00/cd.git
cd cd/
sed "s/tagVersion/2.0/g" -i deployment.yaml
cat deployment.yaml
git add .
git commit -m "tag changed"
git status
