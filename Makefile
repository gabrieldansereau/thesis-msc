# From  https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# -----------------------------------------------------------------------------
# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: thesis.pdf all clean thesis rm figures

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.

all: thesis figures
thesis: thesis.pdf figures
md2tex: assets/_article1.tex assets/_introduction.tex assets/_conclusion.tex assets/_appendix_joss.tex

# CUSTOM BUILD RULES
# -----------------------------------------------------------------------------
# In case you didn't know, '$@' is a variable holding the name of the target,
# and '$<' is a variable holding the (first) dependency of a rule.
# "raw2tex" and "dat2tex" are just placeholders for whatever custom steps
# you might have.

# %.tex: %.raw
#         ./raw2tex $< > $@

# %.tex: %.dat
#         ./dat2tex $< > $@

assets/_%.tex: %.md
	pandoc --biblatex --filter pandoc-crossref -o $@ $<

# assets/_article1.tex: article1.md
# 	pandoc --biblatex --filter pandoc-crossref -o assets/_article1.tex article1.md

# assets/_introduction.tex: introduction.md
# 	pandoc --biblatex --filter pandoc-crossref -o assets/_introduction.tex introduction.md

# assets/_conclusion.tex: conclusion.md
# 	pandoc --biblatex --filter pandoc-crossref -o assets/_conclusion.tex conclusions.md

# FETCH FIGURES 
FIGFILES=combined-maps.png subareas-combined.png subareas-medians.png subareas-3scales.png comparison-combined.png residuals-combined.png rare-species_ascending_plots.png
FIGPATHS=$(patsubst %.png, figures/%.png, $(FIGFILES))
BARTPATH=../betadiversity-hotspots/fig/bart

figures: $(FIGPATHS)
	
figures/subareas-combined.png: $(BARTPATH)/05-1_bart_subareas_combined.png
	cp $< $@
	
figures/subareas-medians.png: $(BARTPATH)/05-4_bart_subareas_medians.png
	cp $< $@
	
figures/subareas-3scales.png: $(BARTPATH)/05-2_bart_subareas_3scales.png
	cp $< $@

figures/%.png: $(BARTPATH)/07_bart_%.png
	cp $< $@

figures/rare-species_%.png: $(BARTPATH)/08_bart_rare-species_%.png
	cp $< $@

# MAIN LATEXMK RULE
# -----------------------------------------------------------------------------
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

thesis.pdf: thesis.tex introduction.tex article1.tex references.bib assets/*.tex figures
	latexmk -f --quiet -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex

clean:
	@latexmk -c
	@rm -f *.bbl
	@rm -f *.run.xml

rm:
	@latexmk -c
	@rm -f *.bbl
	@rm -f *.run.xml
	rm thesis.pdf
	rm assets/*.tex
	rm figures/*