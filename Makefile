BOOKFILES := $(wildcard *.Rmd) DESCRIPTION _before.R _output.yml book.bib ga.html $(wildcard images/*) style.css toc.css _bookdown.yml

_book/index.html : $(BOOKFILES)
	./scripts/build.sh

_book/Mullen-ComputationalHistoricalThinking.pdf : $(BOOKFILES)
	./scripts/build-pdf.sh

pdf : _book/Mullen-ComputationalHistoricalThinking.pdf

deploy :
	./scripts/deploy.sh

clobber :
	Rscript -e "options(bookdown.clean_book = TRUE); bookdown::clean_book()"

.PHONY : pdf deploy clobber

