#!/bin/bash

git remote set-url origin https://${GIT_TOKEN}@github.com/${GIT_URL}.git

if ! git checkout "$TRAVIS_BRANCH"; then
  err "failed to checkout $TRAVIS_BRANCH"
  return 1
fi