#!/bin/bash
cd $(dirname "$BASH_SOURCE[0]")


export CPLEX_HOME="${CPLEX_HOME:-/opt/ibm/ILOG/CPLEX_Studio2211}"
export CPLEX_MACHINE="${CPLEX_MACHINE:-x86-64_linux/static_pic}"

mkdir -p bin
mkdir -p results


if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo "Build and run the code. Check this file for example usage information."
  exit
fi

g++ -o3 "$@" -o bin/run src/runs.cpp "-I$CPLEX_HOME/cplex/include/"  "-I$CPLEX_HOME/concert/include"  \
    "-L$CPLEX_HOME/concert/lib/$CPLEX_MACHINE" "-L$CPLEX_HOME/cplex/lib/$CPLEX_MACHINE" \
    "-L./concorde" \
    -fopenmp -lconcert -lilocplex -lcplex -lpthread -ldl -l:concorde.a \
    && ./bin/run


# EXAMPLE USAGE:
# ./run.sh -DRUN_HARDFIXING -DHARDFIXING_P=100 -DTSPFILE='"./data/a280.tsp"'