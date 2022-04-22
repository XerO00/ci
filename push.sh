#!/bin/bash

rm -rf cd
git clone https://github.com/XerO00/cd.git
cd cd/
ls
sed "s/tagVersion/2.0/g" deployment.yaml  > deployment.yaml
cat deployment.yaml
git add .
git commit -m 'tag changed'
git status
