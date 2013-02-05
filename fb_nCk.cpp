// wrong

#include "topcoder_header.h"

void pprint (int a[], int len, int k, int start) {
  if (k==0) {
    cout << "\n";
    return;
  }

  for (int i=start; i<len-1; i++) {
    cout << " -- " << a[i];
    pprint (a, len, k-1, i+1);
  }
}

int main () {
  int a[] = {1,2,3,4,5};
  int k=3;
  int len = SizeOfArray(a);

  pprint (a,len,k, 0);
  return 0;
}
