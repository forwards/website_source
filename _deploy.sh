#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "rforwards-auto@protonmail.com"
git config --global user.name "rforwards-auto"

mkdir build-result
cd build-result
git init
cp -r ../public/* ./
git add --all *
git commit -m "Update website" || true
git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/test-forwards-home.git" master > /dev/null 2>&1
