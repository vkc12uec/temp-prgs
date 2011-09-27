/*
Tutorial to create static | shared lib for mean function

@ http://www.adp-gmbh.ch/cpp/gcc/create_lib.html

*/

#include <stdio.h>
#include "calc_mean.h"

int main(int argc, char* argv[]) {

  double v1, v2, m;
  v1 = 5.2;
  v2 = 7.9;

  m  = mean(v1, v2);

  printf("The mean of %3.2f and %3.2f is %3.2f\n", v1, v2, m);

  return 0;
}

