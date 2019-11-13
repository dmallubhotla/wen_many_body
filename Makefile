LATEXMK = latexmk -pdflatex="luahblatex %O %S" -pdf -dvi- -ps- -quiet -logfilewarninglist
WS = wolframscript -f

PDF_DIR = pdfs/
TEX_DIR = tex/

SOURCES := $(wildcard tex/*.tex)
OUTPUTS := $(patsubst tex/%.tex, pdfs/%.pdf,$(SOURCES))


all: $(OUTPUTS)

.PHONY: all tidy clean

tidy:
	cd tex; latexmk -c
	rm -f tex/*.tdo

clean:
	rm -f pdfs/*
	cd tex; latexmk -C
	rm -f tex/*.tdo

$(OUTPUTS): pdfs/%.pdf: tex/%.tex
	cd $(<D); $(LATEXMK) $(<F)
	mv $(<D)/$(@F) $@