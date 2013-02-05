
#include <iostream>

// Write a program that calculates rate of return on a $100 treasury bond given its current price and days to maturity
//
using namespace std;

float get_rate (float curr_price, int days) {
  float f = (100-curr_price)*365/days;
  return f;
}

int main () {
  cout << "\n rate = " << get_rate (95.5, 153);
  return 0;
}
