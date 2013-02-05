
#include "topcoder_header.h"


int maxSum1(int a[], int len) {
  int m = 0;
  int msuf = 0;
  // Invariant: m is the maximum subsequence sum for a[0..i-1],
  //            msuf is the maximum suffix sum for a[0..i-1]
  int c = 2*len - 1, j=0;

  for (int i = 0; i < c; i++) {
    msuf = max(0, msuf + a[j]);
    m = max(m, msuf);
    j = (j+1)%len;
  }
  return m;
}

int maxSum(int a[], int len) {
  int m = 0;
  int msuf = 0;
  // Invariant: m is the maximum subsequence sum for a[0..i-1],
  //            msuf is the maximum suffix sum for a[0..i-1]
  for (int i = 0; i < len; i++) {
    msuf = max(0, msuf + a[i]);
    m = max(m, msuf);
  }
  return m;
}


int maxSum (int a[], int length, int t)
{
  int m = 0;
  int m_st=0, m_end=0;
  int msuf = 0;
  int msuf_st=0, msuf_end=0;
  // Invariant: m is the maximum subsequence sum for a[0..i-1],
  //            msuf is the maximum suffix sum for a[0..i-1]

  for (int i = 0; i < length; i++) {
    if (0 < msuf + a[i]) {
      msuf_end = i;
      msuf = msuf + a[i];
    }
    else {
      msuf = 0;
      msuf_st = i+1;  // anticipate that next will be +ve
      msuf_end = i+1;
    }
    if (m < msuf) {
      m_st = msuf_st;
      m_end = msuf_end;
      m = msuf;
    }
  }
  printf ("\n pointers = %d || %d ", m_st, m_end);
  printf ("\n final = %d", m);

  return m;
}

int main () {
    int a[] = {1, 5, -2, -3, -4, 2, 1, 1, 5, -2, -3, -4, 2, 1};
    //int a[] = {1, 5, -2, -3, -4, 2, 1};
    int len = SizeOfArray(a);

    cout <<  "\n -- " << maxSum (a, len);
    cout <<  "\n -- " << maxSum1 (a, len);
    return 0;


}
