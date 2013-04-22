
/*
   For instance,  2223333444555,   num_occurrence(4) for this array is  3.

*/

#include "topcoder_header.h"

static int lb=-1, rb=-1, cnt=0;

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
  cnt++;
  if (st > end)
    return;
  else {
    int mid = (st+end)/2;

    if (a[mid] < num)
      bin_search (a, mid+1, end, num);
    else if (a[mid] > num)
      bin_search (a, st, mid-1, num);
    else {
      if (a[mid] == num && (mid == 0 || a[mid-1] < num))    // mid-1 >= 0
        lb = mid;   //can quick exit if rb is assigned
      else if (a[mid] == num && a[mid+1] > num)   //mid+1 <= len-1
        rb = mid;
    }
  }
}

int num_occurrence1(int * A, int st, int end, int num)
{
    int mid;

    if (end == 0) return 0; 
    if (A[0] == num && A[end] == num) return (end-st+1);

    mid = (st+end)/2;
    
    if (A[mid] > num) 
      return num_occurrence1(A, st, mid, num);
    else if (A[mid] < num)
      return num_occurrence1(A , mid+1, end, num);
    else{
      int left = num_occurrence1(A, st, mid, num);
      int right = num_occurrence1(A , mid+1 , end , num);
      return left+ right + 1;
    }    
}

int num_occurrence(int * A, int len, int num)
{
    int mid;

    if (len == 0) return 0; 
    if (A[0] == num && A[len-1] == num) return len;

    mid = len / 2;
    
    if (A[mid] > num) 
      return num_occurrence(A, mid, num);
    else if (A[mid] < num)
      return num_occurrence(A + mid + 1, len - mid - 1, num);
    else{
      int left = num_occurrence(A, mid, num);
      int right = num_occurrence(A + mid + 1, len - mid -1, num);
      return left+ right + 1;
    }    
}


int main () {
  int a[] = {2,2,2,3,3,3,3,4,4,4,5,5,5};
  int len = SizeOfArray (a);

cout << "\n |"<<num_occurrence (a, len, 2);
cout << "\n |"<<num_occurrence (a, len, 3);
cout << "\n |"<<num_occurrence (a, len, 4);
cout << "\n |"<<num_occurrence (a, len, 5);

cout << "\n |"<<num_occurrence1 (a, 0, len, 2);
cout << "\n |"<<num_occurrence1 (a, 0, len, 3);
cout << "\n |"<<num_occurrence1 (a, 0, len, 4);
cout << "\n |"<<num_occurrence1 (a, 0, len, 5);

  bin_search (a, 0, len-1, 2);
  cout << "\n lb = " << lb << " rb ="<< rb << " cnt = "<< cnt;;

  bin_search (a, 0, len-1, 3);
  cout << "\n lb = " << lb << " rb ="<< rb << " cnt = "<< cnt;;
  bin_search (a, 0, len-1, 4);
  cout << "\n lb = " << lb << " rb ="<< rb << " cnt = "<< cnt;;
  bin_search (a, 0, len-1, 5);
  cout << "\n lb = " << lb << " rb ="<< rb << " cnt = "<< cnt;;

  bin_search (a, 0, len-1, 6);
  cout << "\n lb = " << lb << " rb ="<< rb << " cnt = "<< cnt;;

  return 0;

  find_last_occu (a, 0, len-1, 3);
  cout << "\n lb ="<<lb<< " rb ="<< rb;

  find_last_occu (a, 0, len-1, 4);
  cout << "\n lb ="<<lb<< " rb ="<< rb;

  return 0;
}
