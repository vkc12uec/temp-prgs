
/*
   longest increasing sequence
   using DP

   - modified lis prints the maxi. sum for the increasing subseq

*/

#include "topcoder_header.h"
#include "limits.h"

int lis (int a[], int len) {
  int dp[len];  // = {0};    // dp[i] length of longest seq. ending at a[i]

  memset (dp, 0, len);
  dp[0] = 1;
  int msum[len];
  memset (msum, 0, len);
  msum[0]= max(a[0],0); 

  for (int i=1; i<len; i++) {
    int maxfori = INT_MIN;
    int maxSumfori = INT_MIN;

    for (int j=0; j<= i-1; j++) {
      if (a[i] > a[j]) {
        maxfori = max (dp[j] + 1, maxfori);
        maxSumfori = max (msum[j]+a[i], maxSumfori);
      }
    }
    dp[i] = maxfori;
    msum[i] = maxSumfori;
  }

  ///* lis code
  int top = dp[0];
  for (int i=1; i<len; i++)
    top = max (top, dp[i]);

  return top;
}

int nlogn (int a[], int len) {
  // return length of lis using nlogn algo.
  
}

int main () {

  /*  0, 2, 6, 9, 13, 15 */
  int d[] =  {0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15}; // L=6
  int c[] = {1, 101, 2, 3, 100, 4, 5}; // L=5
  int b[] = {3,4,5,10}; // L =4
  int a[] = { 2, 5, 3, 7, 11, 8, 10, 13, 6 };     //L=6
  int len = SizeOfArray (a);

  /*
     int top = msum[0];
     for (int i=1; i<len; i++)
     top = max (top, msum[i]);

*/
  cout << "\n longest = " << lis(a, len);
  cout << "\n longest = " << lis(b, SizeOfArray(b));
  cout << "\n longest = " << lis(c, SizeOfArray(c));
  cout << "\n longest = " << lis(d, SizeOfArray(d));
  //cout << "\n max lis sum = " << top;
  return 0;
}
