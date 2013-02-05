/*
Given an array containing sequence of bits (0 or 1), you have to sort this array in the ascending order i.e. all 0' in first part of array followed by all 1's. The constraints is that you can swap only the adjacent elements in the array. Find the minimum number of swaps required to sort the given input array.

Example: Given the array (0,0,1,0,1,0,1,1) the minimum number of swaps is 3.

Note: You just need to complete the function given below for this task. The function is given a binary string as input and returns the required answer.
*/

#include "topcoder_header.h"

int main() {
  int a[] = {1,1,1,1,1,1};  //{1,1,1,0,0,0 };    //{0,0,1,0,1,0,1,1};
  int len=SizeOfArray(a);

  int nzero=0, total=0;

  for (int i=len-1; i>=0; i--) {
    if (a[i] == 0)
      nzero++;
    else {
      if (nzero > 0)
        total += nzero;
    }
  }

  cout << "\n Swaps = "<< total;

  return 0;
}
