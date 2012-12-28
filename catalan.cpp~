/*
 * for given n, find no. of patterns posssible where 
 * # 1 = n and # 0 = n+1
 * this is wiil give the no. of different binary tress possible

 * For any position i in the sequence s and i != 2n,  the number of "1" should always be no smaller than the number of "0" in the sub-sequence s[0, i].
 * 
 */

#include "topcoder_header.h"

using namespace std;

static void printPar(int l, int r, char str[], int count) {
  if (l < 0 || r < l) return; // invalid state
  if (l == 0 && r == 0) {
    str[count] = 0;
    cout << "\n"<<str; // found one, so print it
  } 
  else {
    if (l > 0) { // try a left paren, if there are some available
      str[count] = '(';
      printPar(l - 1, r, str, count + 1);
    }
    if (r > l) { // try a right paren, if there’s a matching left
      str[count] = ')';
      printPar(l, r - 1, str, count + 1);
    }
  }
}

void fill ( char *res, int fillptr, int len, int n1, int n0) {  // n1 n0 are nummbers of reamining 1s and 0s
  static int count = 0;

  if (n0 < n1 || n1 < 0 || n0 < 0)
    return;

  if (!n1 && !n0) {
    count++;
    cout << "\n count = " << count;
    res[fillptr] = '0';
    res[fillptr] = '\0';
    cout << "\n s = "<<res;
  }

  if (n1 > 0) {
    res[fillptr] = '1';
    fill (res, fillptr+1, len , n1-1, n0);
  }

  if (n0 > n1) {
    res[fillptr] = '0';
    fill (res, fillptr+1, len , n1, n0-1);
  }

}

int main () {
  int n=4;
  char res[2*n+1+1];
  int fillptr = 0, n1=n, n0=(n);

  /*
     int l=5, r=5, count=0;
     char str[l+r+1];

     printPar(l, r, str, count);
     */

  fill (res, fillptr, 2*n+1, n1, n0);

  //cout << "\ntotal = "<< count;
  return 0;
}
