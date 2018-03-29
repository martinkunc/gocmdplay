#!/bin/bash

BRANCH=$(git branch | grep -e "^*" | cut -d' ' -f 2)

git checkout updating-vendors

cd vendor

git add . -A 

cd ..

git add Gopkg.lock Gopkg.toml

git commit -m "Updating vendors"


git checkout $BRANCH

git merge updating-vendors -m "Merging udpated vendors"
