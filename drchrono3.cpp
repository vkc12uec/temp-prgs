

#include "topcoder_header.h"

int myatoi (char c) {
  return int(c) - int ('0');
}

int getLen (string s) {

  // n^3 solution
  int len = s.length();
  ii st_end;
  int i=0, j=1;
  int st , end, rangesum, rangelen, lsum, rsum, ranges, rangee, maxrange = INT_MIN;

  for (; i<=len-2; i++) {
    cout << "\ti = "<<i;
    //for (j=i+1; j<=len-1; j++) {
    j = i+1;
    cout << "\t\tj = "<<j;
      st = i;
      end = j;
      rangesum=0;
      rangelen=0;
      lsum=0;
      rsum=0;
      ranges=0, rangee=0;

      while (st >=0 && end <= len-1) {
        lsum += myatoi( s[st] );
        rsum += myatoi( s[end] );

        if (lsum == rsum) {
          rangesum = 2*lsum;
          ranges=st;
          rangee=end;
        }
        st--;
        end++;
      } // while

      if (rangesum) 
        cout << "\n rangesum = " << rangesum << " and range = " << ranges << " " << rangee;
      //}
  }

  return 100;
}

int main () {
  unsigned int i=50;
  unsigned int j = ~(i);

  unsigned int mask=1;

  while (i) {
    bit = j & mask;
  }

  cout << "\n j = " << j;
  
  #if 0
  string s1="123231", s2="986561517416921217551395112859219257312";
  cout << "\nl1 = " << getLen(s1);  // << "\nl2 = "<< getLen(s2);
  #endif

  return 0;
}

/*
   Question 3 / 4 (Equal Sum Substring)
   Complete the function getEqualSumSubstring, which takes a single argument. The single argument is a string s, which contains only non-zero digits. 
   This function should print the length of longest contiguous substring of s, such that the length of the substring is 2*N digits (maximum length of the string is 49) and the sum of the leftmost N digits is equal to the sum of the rightmost N digits.If there is no such string, your function should print 0.

   Sample Test Cases: 

   Input #00:
   123231

   Output #00:
   6

Explanation:
1 + 2 + 3 = 2 + 3 + 1. 
The length of the longest substring = 6 where the sum of 1st half = 2nd half

Input #01:
986561517416921217551395112859219257312

Output #01:
36
*/
