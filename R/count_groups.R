## Count the number of groups events
## `*` are only used with events
## Input: Rmd files names
count_groups = function(fnames) {
  len = -2 # For two example sites
  for(fname in fnames) {
    x = paste(readLines(fname), collapse = "\n")
    len = len + length(gregexpr("\\*", x)[[1]])
  }
  len
}
