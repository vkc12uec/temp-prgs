/* is machine big or small endian */

#include <stdio.h>

int main () {
  int i = 1; 
  char *c = (char *) &i;
  printf ("\n [%d]" , *c);
  return 0;
}

