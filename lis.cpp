
/*
longest increasing sequence
using DP

*/

#include "topcoder_header.h"
#include "limits.h"

int main () {
  
    /*  0, 2, 6, 9, 13, 15 */
  int a[] =  {0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15};
  int len = SizeOfArray (a);
  int dp[16] = {0};    // dp[i] length of longest seq. ending at a[i]

  dp[0] = 1;

  for (int i=1; i<len; i++) {
    int maxfori = INT_MIN;

    for (int j=0; j<= i-1; j++) {
      if (a[i] > a[j])
        maxfori = max (dp[j] + 1, maxfori);
    }
    dp[i] = maxfori;
  }

  int top = dp[0];
  for (int i=1; i<len; i++)
    top = max (top, dp[i]);

  cout << "\n longest = " << top;
  return 0;
}
