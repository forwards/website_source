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

[ "$TRAVIS_PULL_REQUEST" != "false" ] && echo push pull request build result && git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/rforwards-auto.github.io.git" master > /dev/null 2>&1 && exit 0

[ "${TRAVIS_BRANCH}" != "master" ] && echo push non-master branch build result && git push --force --quiet "https://$GITHUB_PAT@github.com/rforwards-auto/rforwards-auto.github.io.git" master > /dev/null 2>&1 && exit 0

[ "${TRAVIS_BRANCH}" = "master" ] && echo push forwards.github.io build result && git push --force --quiet "https://$GITHUB_PAT@github.com/forwards/forwards.github.io" master > /dev/null 2>&1
