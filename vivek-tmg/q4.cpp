
#include <iostream>

// wiki:
//
// A zero-coupon bond (also called a discount bond or deep discount bond) is a bond bought at a price lower than its face value, with the face value repaid at the time of maturity.[1] It does not make periodic interest payments, or have so-called "coupons," hence the term zero-coupon bond. When the bond reaches maturity, its investor receives its par (or face) value.
//
//Assuming constant rate of interest NOT compounded
// 12 months each of 30 days
//
//

using namespace std;

float rate (float curr_price, int days) {
  float ret = (100-curr_price)*360/days;
  return ret;
}

int main () {
  float face = 100;
  float costprice = 95.5;
  int days = 153;

  cout << "\n Rate of interest = " << rate (costprice , days);
  return 0;
}
