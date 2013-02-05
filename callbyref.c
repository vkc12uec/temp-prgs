

/* u dont do as follows, value of *a is not relefected back */

#include<stdio.h>

void change (int *a) {
  a = (int *)malloc (sizeof (int));
  *a=10;
  return;
}

int main () {
  int *p;
  change(p);
  printf ("\n decimal = %d", *p);
  return 0;
}
