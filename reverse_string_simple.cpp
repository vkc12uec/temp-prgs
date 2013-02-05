
#include "topcoder_header.h"
#include "string.h"

int main () {

  char a[] = "boss";    // hello
  int n = strlen(a);
  for (int i=0;i<(n/2);i++) {
    char c = a[i];
    a[i] = a[n-i-1];
    a[n-i-1] = c;
  }

  cout << "\n a = " << a;
  return 0;

}
