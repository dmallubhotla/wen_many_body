LATEXMK = latexmk -pdflatex="luahblatex %O %S" -pdf -dvi- -ps- -quiet -logfilewarninglist
WS = wolframscript -f

all: 2.1.1.pdf 2.1.1-clean.pdf

.PHONY: all clean

clean:
	latexmk -C

%.pdf: %.tex
	$(LATEXMK) $<
