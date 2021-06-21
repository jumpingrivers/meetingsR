suppressMessages(library("tidyverse"))

##############################
# 1. Read in the data
##############################

rmds = "04-virtual.Rmd"

############################3
# 2. Function to extract data
#############################

rmd_parse = function(entry) {
  values = list(year = NA, month = NA, date = NA, name = NA,
                link = NA, twitter = NA)

  ## Globs
  link = "\\[([\\w -/':?]*)\\](?=\\()\\(([\\w|/|:|\\-|\\.|#]*)\\)"
  exact_date = "(.*)"
  if (str_detect(entry, "^## ")) {
    values[[1]] = str_match(entry, "^## (.*) ")[2]
  }

  if (str_detect(entry, "^### ")) {
    values[[2]] = str_match(entry, "^### (.*)")[2]
  }
  if (str_detect(entry, "\\*")) {
    reg = paste0("^[ \\* ]*", exact_date, ": ", link, "\\.")
    (parsed = str_match(entry, reg))
    values[3:5] = parsed[2:4]
    twitter = str_match(entry, "\\@([a-zA-Z_]*)\\]")[2]
    values[6] = twitter
  }
  as_tibble(values)
}

events = readLines(rmds) %>%
  map_df(rmd_parse) %>%
  fill(year, month) %>%
  filter(!(is.na(year) | is.na(link))) %>%
  mutate(year = stringr::str_remove(year, "`r get_btn\\(\\)`")) %>%
  mutate(year = stringr::str_squish(year))

write("# Automatically generated file. Edit the .Rmd file instead.", file = "docs/virtual.csv")
write_csv(events, file = "docs/virtual.csv", append = TRUE)
