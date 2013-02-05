
#include "topcoder_header.h"
// http://basicalgos.blogspot.com/2012/02/string-reduction-given-string.html

void mytest(char *s) {
}

int main () {
  char *test[] = { "cab", "bcab", "bbbbb" };
  int len = SizeOfArray(test);
  
  for (int i=0; i<len; i++)
    mytest(test[i]);

  return 0;
}
