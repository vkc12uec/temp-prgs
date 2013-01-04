#include <iostream>
#include <stdio.h>

int main () {

#define LEN 5

  int A[LEN][LEN] = { {0, 100, 9, 3, 1 } , {100, 0 , 4, 100, 2 } , {9, 4, 0, 10, 100 }, {3,100, 10, 0, 100 } , { 1, 2, 100, 100, 0}  };
  //{ {0,2,3,4}, {2,0,6,5}, {3,6,0,7}, {4,5,7,0} };
  //int A[LEN][LEN] = { {0,3,4,7}, {3,0,5,100}, {4, 5, 0 ,6}, {7,100, 6,0} };
  int C[LEN][LEN];
  int B[LEN];

  int i,j,k;
  for (i=0; i<LEN; i++)
    for (j=0; j<LEN; j++)
    {
      // A[i,k] , A[k,j]
      int min = 1000;
      for (k=0; k<LEN; k++) {
        int tempmax = (A[i][k] > A[k][j]) ? A[i][k] : A[k][j];
        min = (tempmax < min) ? tempmax : min;
      }
      C[i][j] = min;
      //min = sum = sum + A[i][k]*B[k][j];
    }

    printf ("\n");
 for (i=0; i<LEN; i++){
  for (j=0; j<LEN; j++) {
    printf (" %d ", C[i][j]);
  }
    printf ("\n");
  }

// 2nd mult
  for (i=0; i<LEN; i++)
    for (j=0; j<LEN; j++)
    {
      // A[i,k] , A[k,j]
      int min = 1000;
      for (k=0; k<LEN; k++) {
        int tempmax = (C[i][k] > C[k][j]) ? C[i][k] : C[k][j];
        min = (tempmax < min) ? tempmax : min;
      }
      A[i][j] = min;
      //min = sum = sum + A[i][k]*B[k][j];
    }

    printf ("\n");
 for (i=0; i<LEN; i++){
  for (j=0; j<LEN; j++) {
    printf (" %d ", A[i][j]);
  }
    printf ("\n");
  }

// 3rd mult
  for (i=0; i<LEN; i++)
    for (j=0; j<LEN; j++)
    {
      // A[i,k] , A[k,j]
      int min = 1000;
      for (k=0; k<LEN; k++) {
        int tempmax = (A[i][k] > A[k][j]) ? A[i][k] : A[k][j];
        min = (tempmax < min) ? tempmax : min;
      }
      C[i][j] = min;
      //min = sum = sum + A[i][k]*B[k][j];
    }

    printf ("\n");
 for (i=0; i<LEN; i++){
  for (j=0; j<LEN; j++) {
    printf (" %d ", C[i][j]);
  }
    printf ("\n");
  }

return 0;
}
