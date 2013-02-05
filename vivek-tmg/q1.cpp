/*
 * Input : array of length = 99
 *
 * Sol.: Sum (i) = n(n+1)/2  for n=100
 *      Sum (array) = S
 *
 *      Reqd. = Sum(100) - S;
 */

#include <iostream>
using namespace std;

const int N = 100;
//const int N = 5; test

int find_spy_id (int *a, int len) {

  int reqd = N*(N+1)/2;
  int Si = 0;

  for (int i=0; i<len; i++)
    Si += a[i];

  return (reqd - Si);
}

int main () {
  int a[N-1];                                   // = {1, 3, 4, 5};
  
  for (int i=0;i<N-1; i++)
    a[i] = i+1;                     
  
  a[50] = 100;            // 51 is missing

  cout << "\n Spy id = " << find_spy_id (a, N-1);
  return 0;
}
