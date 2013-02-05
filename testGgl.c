
#include "stdio.h"

void f(char *x) {

  x++;

  //*(x+1) = 'a'; //.a.;

}

int main() {

  char *str = "hello";

  f(str);

  printf("%s", str);

  return 0;
}


