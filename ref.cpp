

#include "topcoder_header.h"

int main () {
  int b=5, c=10;
  int &a=b;
  cout << "\n" << a;
  a=c;
  cout << "\n b" << b;

  return 0;

}
