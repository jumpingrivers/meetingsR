#!/bin/bash
set -o errexit -o nounset
BASE_REPO=$PWD

update_website() {
  git config --global user.name "jumpingrivers"
  git config --global user.email "csgillespie+jumpingrivers@gmail.com"

  git clone  \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output

  cd book-output
  cp -fvr ../_book/* docs/

  cd docs
  git add libs/; git add css/
  git add *.json; git add *.html; git add main.md; git add style.css
  cd ..
  git commit -a -m "Travis: updating website (${TRAVIS_BUILD_NUMBER})"
  git push origin master 2>err.txt
  cd ..
}

update_website
