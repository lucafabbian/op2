#!/bin/bash
cd $(dirname "$BASH_SOURCE[0]")
export TITLE="Solving the Travelling Salesman Problem: a comparison between popular strategies"

rm -rf ./report
mkdir -p ./report

cp TSP.ipynb ./report
cp refs.bib ./report
cp ieee.csl ./report
cp -r imgs ./report

bun makeplot.ts

cd ./report
jupyter nbconvert --to markdown TSP.ipynb

bun ../polish-report.ts

# IMPORTANT: KEEP SURE THERE ARE NO SPACE BETWEEN INLINE MATHS AND $
# $formula = dfgd$
# otherwise jupyter will recognize them but pandoc will not

pandoc -s TSP.md -t pdf -o TSP.pdf \
  --pdf-engine-opt="-interaction=nonstopmode" \
  --filter pandoc-citeproc --bibliography="refs.bib" --csl="ieee.csl" -N -V title:"$TITLE"

rm ../TSP.pdf
mv TSP.pdf ..

# Older code to use intermediate LaTeX
#cp TSP.ipynb "./report/$TITLE.ipynb"
#cp refs.bib  ./report
#cd ./report
#jupyter nbconvert "$TITLE.ipynb" --to latex --output TSP.tex --embed-images --LatexPreprocessor.style=vs
#
## compile the report from latex to pdf
#pdflatex -interaction=nonstopmode TSP.tex