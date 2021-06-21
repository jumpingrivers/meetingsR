
get_btn = function() {
  url = 'https://github.com/jumpingrivers/meetingsR/blob/main/'
  gh_edit_path = paste0(url, knitr::current_input())
  #
  paste0('<a href="', gh_edit_path,
         '" class = "h2-side-link">',
         '<img src="https://bit.ly/2RRirG7" ',
         'alt="fa-edit" ',
         'class="edit"></a>')
}

