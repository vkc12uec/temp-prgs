
/*

Given an array A[] consisting 0s, 1s and 2s, write a function that sorts A[]. The functions should put all 0s first, then all 1s and all 2s in last.

Example
Input = {0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1};
Output = {0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2}

The problem is similar to our old post Segregate 0s and 1s in an array, and both of these problems are variation of famous Dutch national flag problem.
*/

/*
mtd 1:
  in single swap, make 2 pointers p0, p2 (which point to indices which are not 0 or 2 respectively)
    then make a single sweep, and swap values to order.  You might have to swap twice is the moving element is 0 while shifting 2 to right

mtd 2:    IMPLEMENTED
  partition_across(1);
  partition_across(2);
  */

#include "topcoder_header.h"

void Swap (int a[], int p, int i) {
  int t=a[p];
  a[p] = a[i];
  a[i] = t;
}

void partition_across (int a[], int len, int pivot) {
  int p=0;

  for (int i=0; i<len; i++) {
    if (a[i] < pivot) {
      Swap (a, p, i);
      p++;
      }
  }

  printarr(a,len);
}

int main () {
  int a[] = {0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1};
  int len = SizeOfArray(a);

  int pivot=1;
  partition_across (a, len, pivot);
  //return -1;
  pivot=2;
  partition_across (a, len, pivot);

  //cout << "\n";
  //for (int i=0; i<len; i++)
  //cout << " -- " << a[i];

  return 0;
}
