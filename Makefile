LATEXMK = latexmk -pdflatex="luahblatex %O %S" -pdf -dvi- -ps- -quiet -logfilewarninglist
WS = wolframscript -f

all: 2.1.1.pdf

.PHONY: all clean

clean:
	latexmk -C

2.1.1.pdf: 2.1.1.tex
	$(LATEXMK) $<
