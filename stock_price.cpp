/*
Given an array of stock prices from day 0 to N-1 of a company X, we have to find the max
loss that is possible. Loss occurs if stock is bought at higher price and sold at lower price.
Ex: 1 2 3 7 5 8 9 4 6 10 12 (algo and code including main)
Max Loss is 9 - 4 = 5 (Possible losses are 8-4 = 4, 7-5 = 2 etc). Max difference between
stock price is 12 - 1 = 11 but max loss is 9 -4 = 5
*/

// algo: O(n2):
//       from position i, considerig a[i] to be max, find that min on its right which will
//       give you lowest min ....

/*
Given an Array A={-2,4,30,-50,90,-60,100,120}
The array index represents time of day.
Say 0-9 A.M, 1- 10 A.M....etc
And value represents stock price at that time.

Get the max profit. i.e in this input,
best buying price=-60
best selling price=120

15 
*/
#include <iostream>
#include <limits.h>
using namespace std;

int main () {
  int a[] = {5,4,3,2,1};
  //int a[] = {-2,4,30,-50,90,-60,100,120};
  int len = sizeof (a)/sizeof(int);
  #if 0
  cout << "\n1 :"<< sizeof (a);   // 32
  int *p = a;
  cout << "\n2 :"<< sizeof (p);   // 8
  p = &a[0];
  cout << "\n3 :"<< sizeof (p);   // 8
  #endif
  int min, max, lastProfit = INT_MIN;
  min = (a[0]>a[1]) ? a[1] : a[0];
  max = (a[0]>a[1]) ? a[0] : a[1];

  if (min == a[0])
    lastProfit = max - min;

  cout <<"\n min | max | lastp "<< min << " "<< max << " "<<lastProfit;

  for (int i=2 ; i<len ; i++) {
    if (min > a[i]) {
      min = a[i];
      cout << "\n min changed = "<<min;
      }
    else {
      lastProfit = (lastProfit > (a[i] - min) ) ? lastProfit : (a[i] - min);
      cout << "\n lastProfit changed = "<<lastProfit;
    }
  }

  cout << "\nfinal profit = "<< lastProfit;

  return 0;
}
