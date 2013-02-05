
/*
  this program test for 2 things
*/
#include<stdio.h>

int main () {
  // 1
  int *z;
  &z = 5000;  // err

  //2
  printf ("\n pointer = [%p]", z);
  int t =5;
  char c = 'A';
  char *pc = &c;
  t = *pc;
  printf ("\n %d", t);
  return 0;
  
}
