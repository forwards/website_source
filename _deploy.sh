#!/bin/sh

set -e

git config --global user.email "rforwards-auto@protonmail.com"
git config --global user.name "rforwards-auto"

mkdir build-result
cd build-result
git init
cp -r ../public/* ./
touch .nojekyll
git add --all *
git commit -m "Update website" || true

[ "$TRAVIS_PULL_REQUEST" != "false" ] && git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/pull.git" master > /dev/null 2>&1 && exit 0

[ "${TRAVIS_BRANCH}" != "master" ] && git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/draft.git" master > /dev/null 2>&1 && exit 0

git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/test-forwards-home.git" master > /dev/null 2>&1
