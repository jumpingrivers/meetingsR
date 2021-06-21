#!/bin/bash
set -o errexit -o nounset
BASE_REPO=$PWD

update_website() {
  Rscript -e 'source("R/parse_groups.R")'
  Rscript -e 'source("R/parse_events.R")'
  Rscript -e 'source("R/parse_virtual.R")'

  cd ..; mkdir gh-pages; cd gh-pages
  git init

  git config --global user.name "jumpingrivers"
  git config --global user.email "csgillespie+jumpingrivers@gmail.com"
  git config --global push.default simple
  git remote add upstream "https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git"
  git fetch upstream 2>err.txt
  git checkout gh-pages

  cp -fvr $BASE_REPO/_book/* .
  git add libs/*; git add css/*
  git add *.json; git add *.html; git add main.md; git add style.css events.csv groups.csv virtual.csv
  git commit -a -m "#rstats ${TRAVIS_COMMIT_MESSAGE} (${TRAVIS_BUILD_NUMBER})"
  git status
  git push 2>err.txt
  cd ..
}

update_website
