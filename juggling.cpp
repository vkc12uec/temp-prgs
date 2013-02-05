

/*
http://www.geeksforgeeks.org/archives/2398

1 2 3 4 5 6 7
3 4 5 6 7 1 2

mtd 1:
rev [ rev (1 2 ) + rev (3 4 5 6 7) ]

mtd 2:

This is an extension of method 2. Instead of moving one by one, divide the array in different sets
where number of sets is equal to GCD of n and d and move the elements within sets.
If GCD is 1 as is for the above example array (n = 7 and d =2), then elements will be moved within one set only, we just start with temp = arr[0] and keep moving arr[I+d] to arr[I] and finally store temp at the right place.

Here is an example for n =12 and d = 3. GCD is 3 and

Let arr[] be {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}

n = 12 d = 3 ; now code

*/

#include "topcoder_header.h"

int gcd (int a, int b) {
  if (b==0)
    return a;
  else
    return gcd (b, a%b);
}

int main () {
  int a[] =  {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}, d=4;
  int len = SizeOfArray(a);
  int gc = gcd( SizeOfArray(a), d);


  int nsub = SizeOfArray(a)/gc;
  int stid = gc-1, cstid;

  cout << "\n gc = " << gc << " nsub = " << nsub;

  while (1) {
    cout << "\n stid = " << stid << " nsub = " << nsub;
    cstid = stid;
    int save = a[cstid];
    int endid = cstid+gc;

    while (endid < len) {
      a[cstid] = a[endid];
      cstid = endid;
      endid += gc;
    }
    a[cstid] = save;
    //break;

    for (int i=0; i <len; i++)
      cout << "\t " << a[i];

    cout << "\n";

    stid -= 1;
    if (stid < 0) break;
    nsub -= 1;
  }

  return 0;

  for (int i=0; i <len; i++)
    cout << "\t " << a[i];

  return 0;
}
