
#include "topcoder_header.h"

/*
 
   2nd method O(n2)
   a[], len

   for (base = 0; base < len; base++)
    add=0;
    for (i=base; i<len; i++) {
      add += a[i]

      if (add == reqd)
          YAHOO
    }
 
 */
int main () {
  int a[] = {15, 2, 4, 8, 9, 5, 10, 23};
  int len = SizeOfArray (a);
  int reqd = 23;
  int curr=a[0], base=0;

  for (int i=1; i<len; i++) {
    cout << "\n i | curr " << i << " | " << curr;

    if (curr == reqd) {
      cout << "\n WOW";
      break;
    }
    else if (curr < reqd) {
      curr += a[i];
      cout << "\n Take one";
    }
    else {
      while (curr > reqd) {
        curr -= a[base];
        cout << "\n Remove "<<a[base];
        base++;
      }
      curr += a[i];
      cout << "\n After remove curr = " << curr;
    }
  }

  cout << "\n NOT WOW ";
  return 0;
}

/*
   Take one
   Take one
   Take one
   Take one
   Remove 15
   Take one
   Take one
   Remove 2
   Remove 4
   NOT WOW [vchaurasiya@unixdeva10:~/tmp/temp-prgs]$

*/
