#include<stdio.h>

extern int  _etext;
extern int  _edata;

int main () {
  printf ("\n %d || %d", _etext ,_edata);

/*
  char *c = _etext;
  while (c != _edata)
    printf ("\n%c", c);
*/

  return 0; 

}
