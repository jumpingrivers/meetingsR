html:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs")'
	Rscript -e 'source("R/parse_groups.R")'
	Rscript -e 'source("R/parse_events.R")'
	Rscript -e 'source("R/parse_virtual.R")'

build:
	make html
	Rscript -e 'browseURL("docs/index.html")'

md:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book",clean=FALSE)'

install:
	Rscript -e 'devtools::install_github("jumpingrivers/meetingsR")'

clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -fvr *.log Rplots.pdf _bookdown_files land.sqlite3

cleaner:
	make clean && rm -fvr rsconnect
	rm -frv *.aux *.out  *.toc # Latex output
	rm -fvr *.html # rogue html files
