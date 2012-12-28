/*
 * sumation (i) = n(n+1)/2
 */

#include <iostream>
using namespace std;

const int N = 5;

int get_spy (int *a, int len) {

  int accu = 0;
  int reqd = N*(N+1)/2;

  for (int i=0; i<len; i++)
    accu += a[i];

  return (reqd - accu);
}

int main () {
  int a[N-1];
  //int a[] = {1,2,3,5};
  
  // generate random 99 ids

  cout << "\n Spy #id = " << get_spy (a, N-1);
  return 0;
}
