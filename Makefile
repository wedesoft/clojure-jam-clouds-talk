.SUFFIXES: .pdf .tex .svg .png .jpg

SVGS = $(wildcard *.svg)

IMAGES = $(wildcard *.png) $(wildcard *.jpg) $(SVGS:.svg=.jpg)

all: clojure-clouds.pdf

clojure-clouds.pdf: clojure-clouds.tex $(IMAGES)
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

clean:
	rm -Rf clojure-clouds.pdf _minted* *.aux *.log *.out *.nav *.snm *.toc *.vrb

.svg.png:
	rsvg-convert -f png -h 1080 $< -o $@

.png.jpg:
	convert $< -quality 90 $@
