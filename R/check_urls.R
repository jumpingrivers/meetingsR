## Simple script for checking that URLs exist.
## What I really want to do is parse the .md file directly.
library("stringr")
## Render book
bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE)

## Use a regular expression to detect urls.
## Then check for a status 200
## http://stackoverflow.com/q/26496538/203420
url_pattern = "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"

files = list.files("docs/", pattern = "*.html", full.names = TRUE)
bad_urls = c() # I know I'm growing a vector, but life is too short
for(fname in files) {
  message(fname)
  urls = str_extract(readLines(fname), url_pattern)
  urls = urls[!is.na(urls)]
  for(url in urls){
    message("Testing url: ", url)
    test_url = httr::GET(url)
    if(test_url$status_code != 200) {
      message("\t", url, " ", test_url$status_code)
      bad_urls = c(bad_urls, url)
    }
  }
}
