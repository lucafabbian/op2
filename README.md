# Solving the Travelling Salesman Problem: a comparison between popular strategies

Final paper: <https://lucafabbian.github.io/op2/TSP.pdf>


## Project structure

```bash
src/        # Source code of the project
bin/        # Built files
data/       # Sample test tours, taken from TSPLib
runs/       # Testbed results

plot/       # Tool for running performance plots + temporary plot files generated from C++ codes
concorde/   # Concorde TSP library, header patched for working with C++

imgs/       # Image files for the report
ieee.csl    # IEEE style format for adding bibliography to the report
refs.bib    # Bibliography

build.sh    # Build the file (used by the notebook)
run.sh      # Compile and run using given defines
results.sh  # Compile and run against the testbed


TSP.ipynb         # Nootebook and source of truth of the report
report.sh         # Generate the report file from the notebook
makeplot.ts       # Generate performance plots images
polish-report.ts  # Hook called in an intermediate step of the report generation


```


## Getting started

Install:
- jupyter notebook + the `ipycpp` kernel
- cplex by ibm
- bun runtime
- pandoc, pandoc-citeproc, and LaTeX



## License

Distributed under the MIT License. Concorde and plot/perfplot.py have their own licenses.

Written during the "Operation Research 2" course, under the supervision of Professor Matteo Fischetti PhD, University of Padova, academic year 2022-2023.
