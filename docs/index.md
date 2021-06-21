--- 
title: "A list of R conferences and meetings"
knit: "bookdown::render_book"
site: bookdown::bookdown_site
documentclass: book
link-citations: yes
twitter-handle: jumping_uk
cover-image: inverse.png
description: "A list of R conferences and meetings."
github-repo: jumpingrivers/meetingsR
url: 'https\://jumpingrivers.github.io/meetingsR/'
edit: 'https://github.com/jumpingingrivers/meetingsR/XXX/main/%s'
---


# Overview <a href="https://github.com/jumpingrivers/meetingsR/blob/main/index.Rmd" class = "h2-side-link"><img src="https://bit.ly/2RRirG7" alt="fa-edit" class="edit"></a>

This site attempts to list R conferences and local useR groups. Please 
feel free to add any missing group or conference. In particular, most of the associated 
twitter names are missing. There are currently __468__ R user groups and events. 
To propose a change, just click the pencil icon next to the titles.

Keep up to date by following [\@rstats_meetings](https://twitter.com/rstats_meetings).

This list is maintained by [Jumping Rivers](https://www.jumpingrivers.com). We also maintain a corresponding list of __[Data Science](https://jumpingrivers.github.io/meetingsDS/)__ conferences and events.

## Technical bit 

The html files for this document live in the `docs/` directory of the [repository](https://github.com/jumpingrivers/meetingsR/). 
When a change is made to the `main` branch, a GitHub Action
creates the html files from the `.Rmd` files and pushes them to the `gh-pages` branch.

I've created a couple of [R scripts](https://github.com/jumpingrivers/meetingsR/tree/main/R) to help
maintain this list. One checks the URL return code 200, the other counts the number of groups.

## Original source

The original list of useR groups was compiled by David Smith at [Revolution Analytics](http://blog.revolutionanalytics.com/local-r-groups.html) blog.
