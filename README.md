# M.Sc. Thesis

## Instructions

[`Makefile`](./Makefile) is used to compiled the pdf. Simply type:
```
make
```
or
```
make thesis.pdf
```

Alternatively, directly use the command compiling the pdf:
```
latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex
```

Generated using the [LaTeX template](http://www.dms.umontreal.ca/downloads/gabaritTPA.zip) from Université de Montréal. More info [here](https://bib.umontreal.ca/evaluer-analyser-rediger/rediger-these-memoire) and [here](https://dms.umontreal.ca/wiki/index.php/LaTeX#M.C3.A9moires.2C_th.C3.A8ses_et_travaux).

Compiled using pandoc 2.11.3.2-1, latexmk 4.70b, and pdfTeX 3.14159265-2.6-1.40.21 (TeX Live 2020/Debian).