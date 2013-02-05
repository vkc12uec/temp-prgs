
#include "topcoder_header.h"
typedef vector< ii > vii;

int main () {
  //int a[] = {0,1,1,2,3,4,3,4,5,5,6,7};
  int a[] = {0,1,1,2,2,2,3,4,5,5,6,7};
  int len = SizeOfArray(a);

  int p1=0, p2=len-1, tmp=0,cp1=0;
  int x=7;

  vii vec;

  while (p1<=p2) {
    tmp = a[p1]+a[p2];

    //cout << "\n p1 | p2 " << p1 << " " << p2;

    if (tmp == x) {
      int cnt1=1, cnt2=1;
      int left=a[p1], right=a[p2];

      while (a[++p1] == left)
        cnt1++;

      while (a[--p2] == right)
        cnt2++;

  /*
      while (a[p1+1] == a[p1]) {
        cnt1++;
        p1++;
      }

      while (a[p2-1] == a[p2]) {
        cnt2++;
        p2--;
      }
      */

      //cout << "\n cnt = " << cnt1 << " cnt2 = "<<cnt2;

      for (int i=0; i<(cnt1*cnt2); i++)
        vec.pb(make_pair(left, right));

      //if (cnt1==1)
        //p1++;
      //if (cnt2==1)
        //p2--;
      }

    else if (tmp < x)
      p1++;
    else
      p2--;
  }   // while

  tr (vec, it) {
    cout << "\n x | y " << it->first << " | " << it->second;
  }

  return 0;
}
