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
  echo "Remote 1"
  echo ${GITHUB_REPOSITORY}
  git remote add upstream "https://${GITHUB_PAT}@github.com/${GITHUB_REPOSITORY}.git"
  echo "Remote 2"
  git fetch upstream #2>err.txt
  echo "Remote 3"
  git checkout gh-pages
  echo "Remote 4"
  cp -fvr ${GITHUB_WORKSPACE}/_book/* .
  echo "Remote 5"
  git add libs/*; git add css/*
  echo "Remote 6"
  git add *.json; git add *.html; git add main.md; git add style.css events.csv groups.csv virtual.csv
  echo "Remote 7"
  echo ${COMMIT_MESSAGE}
  echo ${GITHUB_JOB}
  git commit -a -m "#rstats ${COMMIT_MESSAGE} (${GITHUB_JOB})"
  echo "Remote 8"
  git status
  echo "Remote 9"
  git push
  echo "Remote 10"
  cd ..
  echo "Remote 11"
}

update_website
