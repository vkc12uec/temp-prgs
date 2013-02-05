#include <iostream>
#include <string>
#include <stdio.h>

using namespace std;

unsigned nChoosek( unsigned n, unsigned k )
{
  if (k > n) return 0;
  if (k * 2 > n) k = n-k;
  if (k == 0) return 1;

  int result = n;
  for( int i = 2; i <= k; ++i ) {
    result *= (n-i+1);
    result /= i;
  }
  return result;
}


int main () {
  int one, two, three, four, five, six;
  int sum_left, sum_right, nlucky=0;

  one = 0;
  two = 0;
  three = 0;
  four = 0;
  five = 0;
  six = 0;

  for (one = 0;one <= 9; one++) {
    for (two = 0;two <= 9; two++) {
      for (three = 0;three <= 9; three++) {
        for (four = 0;four <= 9; four++) {
          for (five=0;five <= 9; five++) {
            for (six=0;six <= 9; six++) {

              sum_left = six+five+four;
              sum_right = one+two+three;

              if (sum_left == sum_right) {
                nlucky += 1;
                break;
              }
            }
          }
        }
      }
    }
  }

  cout << "\nTotal lucky nos. = " << nlucky ;
  return 0;
}


/*
 * faster way: Save the 3 digit sum in map and do nC2
 *
 *
 *   mii mcounts;

 for (int i=0; i<= 9; i++) {
 for (int j=0; j<= 9; j++) {
 for (int k=0; k<= 9; k++) {
 sum_left = i+j+k;

 if(present(mcounts, sum_left) == true) {
 mcounts[sum_left] += 1;
 }
 else {
 mcounts[sum_left] = 1;
 }
 }
 }
 }

 int nlucky=0;

 tr (mcounts, it) {
 if (it->second >= 2) {
 int n = it->second;
 int k = 2;
 nlucky += 2*nChoosek(n,k);
 }
 else {
 nlucky += it->second;
 }
 }

 cout << "\nnlucky = " << nlucky;
 return 0;
 */
