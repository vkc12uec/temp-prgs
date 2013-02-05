
/*
 *
 you have a matrix of N x N filled with 1 or 0. you can move only 1 step either right or 1 step down. you need to count maximum number of "connected 1" in given matrix. for example
 0 0 1 1
 1 1 1 0
 1 0 1 0
 0 1 0 1
 [Start from top left] maximum no. of 1 is 4
 [1,0][1,1][1,2][2,2]
 * 
 */

#include "topcoder_header.h"

int main () {
  const int n = 4;
  int dp[n][n] = {0};
  int a[4][4] = {
    {0, 0, 1, 1},
    {1, 1,1, 0},
    {1,0,1,0},
    {0,1,0,1}
  };

  dp[0][0] = a[0][0];

  for (int i=1; i<n; i++) {
    if (a[0][i] == 0)
      a[0][i] = 0;
    else
      dp[0][i] = (dp[0][i-1] + a[0][i]);

    if (a[i][0] == 0)
      dp[i][0] = 0;
    else
      dp[i][0] = (dp[i-1][0]+ a[i][0]);
  }

  for (int i=0; i<n; i++) {
    cout << "\n";
    for (int j=0; j<n; j++)
      cout << " " << dp[i][j];
  }
    

  for (int i=1; i<n; i++) {
    for (int j=1; j<n; j++) {
      if (a[i][j] == 0)
        dp[i][j] = 0;
      else {
          dp[i][j] = max (dp[i-1][j], dp[i][j-1]) + 1;
          // static max var here
      }
    }
  }

  cout << "\n --------- \n";
  for (int i=0; i<n; i++) {
    cout << "\n";
    for (int j=0; j<n; j++)
      cout << " " << dp[i][j];
  }

  return 0;
}
