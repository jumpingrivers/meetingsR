suppressMessages(library("tidyverse"))

##############################
# 1. Read in the data
##############################

rmds = c("03-Rladies.Rmd", "02_useR_groups_asia.Rmd", "02_useR_groups_europe.Rmd",
         "02_useR_groups_middle_east_africa.Rmd", "02_useR_groups_north_america.Rmd",
         "02_useR_groups_oceania.Rmd", "02_useR_groups_south_america.Rmd")
############################3
# 2. Function to extract data

#############################

rmd_parse = function(entry) {
  values = list(page = NA, country = NA, city = NA,
                group_name = NA, link = NA, twitter = NA)

  ## Globs
  link = "\\[([\\(\\)\\'\\w -]*)\\](?=\\()\\(([\\w|/|:|\\-|\\.]*)\\)"
  city = "(.*)"
  if (str_detect(entry, "^## ")) {
    # page
    values[[1]] = str_match(entry, "^## (.*)")[2]
  }

  if (str_detect(entry, "^### ")) {
    #country
    values[[2]] = str_match(entry, "^### (.*)")[2]
  }
  if (str_detect(entry, "\\*")) {
    reg = paste0("^[ \\* ]*", city, ": ", link)
    (parsed = str_match(entry, reg))
    values[3:5] = parsed[2:4]
    twitter = str_match(entry, "\\@(.*)\\]")[2]
    values[6] = twitter
  }
  as_tibble(values)
}

groups = map(rmds, readLines)  %>%
  flatten_chr() %>%
  map_df(rmd_parse) %>%
  fill(page, country) %>%
  filter(!(is.na(city) & is.na(link))) %>%
  mutate(country = stringr::str_remove(country, "`r get_btn\\(\\)`")) %>%
  mutate(country = stringr::str_squish(country))

write("# Automatically generated file. Edit the .Rmd file instead.", file = "docs/groups.csv")
readr::write_csv(groups, file = "docs/groups.csv", append = TRUE)
