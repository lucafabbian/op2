#!/bin/bash
cd $(dirname "$BASH_SOURCE[0]")


export CPLEX_HOME="${CPLEX_HOME:-/opt/ibm/ILOG/CPLEX_Studio2211}"
export CPLEX_MACHINE="${CPLEX_MACHINE:-x86-64_linux/static_pic}"

mkdir -p bin
mkdir -p runs

run_testbed(){

  g++ -o3 $2 $3 -DNODEBUG -o bin/$1 src/runs.cpp "-I$CPLEX_HOME/cplex/include/"  "-I$CPLEX_HOME/concert/include"  \
      "-L$CPLEX_HOME/concert/lib/$CPLEX_MACHINE" "-L$CPLEX_HOME/cplex/lib/$CPLEX_MACHINE" \
      "-L./concorde" \
      -fopenmp -lconcert -lilocplex -lcplex -lpthread -ldl -l:concorde.a

  echo "running $1..."
  ./bin/$1  "./data/a280.tsp" >    "runs/$1-1.txt"
  ./bin/$1  "./data/att48.tsp" >   "runs/$1-2.txt"
  ./bin/$1  "./data/att532.tsp" >  "runs/$1-3.txt"
  ./bin/$1  "./data/bier127.tsp" > "runs/$1-4.txt"
  ./bin/$1  "./data/eil101.tsp" >  "runs/$1-5.txt"
  ./bin/$1  "./data/kroA150.tsp" > "runs/$1-6.txt"
  ./bin/$1  "./data/kroA200.tsp" > "runs/$1-7.txt"
  ./bin/$1  "./data/pr299.tsp" >   "runs/$1-8.txt"
  ./bin/$1  "./data/pr439.tsp" >   "runs/$1-9.txt"
  ./bin/$1  "./data/pr1002.tsp" >  "runs/$1-0.txt"

}
run_testbed hardfixing10 -DRUN_HARDFIXING -DDEFAULT_HARDFIXING_P=100
run_testbed hardfixing30 -DRUN_HARDFIXING -DDEFAULT_HARDFIXING_P=300
run_testbed hardfixing50 -DRUN_HARDFIXING -DDEFAULT_HARDFIXING_P=500
run_testbed hardfixing90 -DRUN_HARDFIXING -DDEFAULT_HARDFIXING_P=900

#run_testbed tabulinear -DRUN_TABULINEAR
#run_testbed tabustep -DRUN_TABUSTEP
#run_testbed taburandom -DRUN_TABURANDOM
