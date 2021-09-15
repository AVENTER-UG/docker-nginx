#!/bin/bash
set -e

cd /var/www/html/

if [ -n "$GIT_REPO" ]
then	
  git clone $GIT_REPO .
fi

if [ -n "$GIT_BRANCH" ]
then
  git checkout $GIT_BRANCH
fi

if [ -n "$GIT_TAG" ]
then
  git checkout tags/$GIT_TAG
fi

rm -rf .git 2>/dev/null

chown -R 100:82 /var/www/html

exec "$@"

