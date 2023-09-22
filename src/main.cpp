#define IPYCPP
// $$ipycpp_file:   src/main.cpp
// $$ipycpp_build:  bash build.sh
// $$ipycpp_run:    bin/main
// $$ipycpp_clevermain: true
#define NODEBUG
#include "include.cpp"
const auto DEFAULT_TSPFILE_SMALL = "./data/pr439.tsp";
const auto DEFAULT_TSPFILE_LARGE = "./data/pr1002.tsp";


int main(){ 

  const int testbedLength = 10;
  int alg1results[] = { 140, 136, 187, 161, 101, 144, 130, 103, 179, 125,};
  int alg2results[] = { 166, 77 , 261, 235, 51 , 175, 151, 218, 234, 56 ,}; 
  int alg3results[] = { 259, 250, 296, 250, 297, 254, 273, 299, 251, 292,};

  // plot points
  FILE *fptr;
  fptr = fopen("./plot/perfcsv.csv","w");
  fprintf(fptr, "3, alg1, alg2, alg3\n");
  for (int i = 0; i < testbedLength; i++){
    fprintf(fptr, "test%d, %d, %d, %d\n", i,
      alg1results[i], alg2results[i], alg3results[i]);
  }
  fclose(fptr);
  system("python3 plot/perfprof.py -D , ./plot/perfcsv.csv"
    " ./plot/result.png -P 'alg1, alg2, alg3'\n");
  printf("$$$ipycppr_file$$$%s\n", "plot/result.png");

}
