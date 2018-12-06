# Latex Makefile using latexmk
PROJNAME=ece4305_lab3

.PHONY: $(PROJNAME).pdf all clean

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

cleanall:
	latexmk -C -bibtex

clean:
	latexmk -c -bibtex
