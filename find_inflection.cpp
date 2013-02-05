/*
2)next question is given an
array of integers...like 10 12 16 17 24 27 8 6 5 4 2....first from 10 to 27 it is in increasing order... .and then decreasing order
starts....so he asked me to find the position from where decreasing starts....it should be done in O(logn).
16 
*/
#include <stdio.h>
void find_tran (int *a, int lo, int high) {
  int mid = 0;
  while (lo<=high) {
    mid = (lo+high)/2;
    printf ("\n mid = %d and a[mid] = %d", mid, a[mid]);
    if (a[mid] > a[mid-1] && a[mid] > a[mid+1]) {
      printf ("\n reqd. = %d", mid);
      break;
    }
    else if ( a[mid] > a[mid+1] && a[mid] > a[high]) {
      high = mid-1;
    }
    else {
      lo = mid+1;
    }
  }
}

main () {
  int a[] = {10 ,12 ,16 ,17 ,24 , 25, 26 , 27 ,5 ,4 ,2};
  //int a[] = {10 ,12 ,16 ,17 ,24 ,27 ,8 ,6 ,5 ,4 ,2};
  int len = sizeof (a)/sizeof(int);

  find_tran(a, 0, len-1);
}
