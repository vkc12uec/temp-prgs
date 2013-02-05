
/*
   For instance,  2223333444555,   num_occurrence(4) for this array is  3.

*/

#include "topcoder_header.h"

static int lb=-1, rb=-1;

  void find_last_occu (int a[], int st, int end, int num ) {
    if (st>end)
      return;

    int mid = (st+end)/2;

    if (a[mid] < num)
      find_last_occu (a, mid+1, end, num);
    else if (a[mid] > num)
      find_last_occu (a, st, mid-1, num);

    //else =
    if (a[mid] == num && a[mid+1] > num) {
      rb=mid;
      return ;
    }
  }

  void bin_search (int a[], int st, int end, int num ) {
    if (st > end)
      return;
    else {
      int mid = (st+end)/2;

      if (a[mid] == num && a[mid-1] < num)    // mid-1 >= 0
        lb = mid;   //can quick exit if rb is assigned
      else if (a[mid] == num && a[mid+1] > num)   //mid+1 <= len-1
        rb = mid;

      bin_search (a, mid+1, end, num);
      bin_search (a, st, mid-1, num);
    }
  }

int main () {
  int a[] = {2,2,2,3,3,3,3,4,4,4,5,5,5};
  int len = SizeOfArray (a);

  int num = 3;
  bin_search (a, 0, len-1, num);

  cout << "\n lb = " << lb << " rb ="<< rb;

  find_last_occu (a, 0, len-1, 3);
  cout << "\n lb ="<<lb<< " rb ="<< rb;

  find_last_occu (a, 0, len-1, 4);
  cout << "\n lb ="<<lb<< " rb ="<< rb;

  return 0;
}
