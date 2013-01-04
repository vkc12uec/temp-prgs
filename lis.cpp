
/*
longest increasing sequence
using DP

- modified lis prints the maxi. sum for the increasing subseq

*/

#include "topcoder_header.h"
#include "limits.h"

int main () {
  
    /*  0, 2, 6, 9, 13, 15 */
  //int a[] =  {0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15};
  //int a[] = {1, 101, 2, 3, 100, 4, 5};
  int a[] = {3,4,5,10};
  int len = SizeOfArray (a);
  int dp[16] = {0};    // dp[i] length of longest seq. ending at a[i]

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

/* lis code
  int top = dp[0];
  for (int i=1; i<len; i++)
    top = max (top, dp[i]);
*/

  int top = msum[0];
  for (int i=1; i<len; i++)
    top = max (top, msum[i]);

  //cout << "\n longest = " << top;
  cout << "\n max lis sum = " << top;
  return 0;
}
