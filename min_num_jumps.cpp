/*
   Given an array of integers where each element represents the max number of steps that can be made forward from that element. Write a function to return the minjimum number of jumps to reach the end of the array (starting from the first element). If an element is 0, then cannot move through that element.

Example:

Input: arr[] = {1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9}
Output: 3 (1-> 3 -> 8 ->9)
First element is 1, so can only go to 3. Second element is 3, so can make at most 3 steps eg to 5 or 8 or 9.
*/

#include "topcoder_header.h"

int main () {
  int a[] = {1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9};
  const int len = SizeOfArray(a);

  int minj[11] = {INT_MAX}; // minj no. of jumps to reach index i
  minj[0]=0;

  /*
  minj(j) = foreach (i<j) Math.minj { minj[i]+a[i] >= j }
  */

  // time is O(n2)
  for (int i=1; i<len; i++) {
    int m=INT_MAX;
    for (int j=0; j<i; j++) {
      if (minj[j] + a[j] >= i)
        m = min (m, minj[j]+1);
    }
    minj[i] = m;
  }

  printArr(minj,len);

  int minm[11] = {INT_MIN};
  minm[10] = 0;

  for (int i=len-2; i>=0; i--) {
    if (a[i] + i >= len-1) {
      minm[i] = 1;
    }
    if (minm[i] ==  INT_MIN) {
      minm[i] = minm[i+1] + 1;
    }
  }

  cout << "\n time = On";
  printArr (minm, len);

  return 0;

}
