

#include <stdio.h>

int main () {
  double a = 1;
  double x = 1;
  int count= 0;

  
  while (a != (1+x)) {
    x /= 2;
    count++;
  }

  printf ("\n szieof f = %lu c = %d", sizeof a,  count);

  return 0;
}
