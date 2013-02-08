
#include "topcoder_header.h"

void numToStr1 (int n, string &s) {
  cout << "\n n = " << n;
  if(n >= 0 && n <=25) {
    s = char(int('a')+n) + s;
    return;
  }
  int last = (n)%26;
  char t = char(int('a')+last);
  s = t+s;
  numToStr1 ( (n-1)/26, s);
}

// correct 
string numToStr (int n) {
  string s = "";
  int last = n%26;
  s += char(int('a')+last);

  n = n/26;

  while (n) {
    last = (n-1)%26;
    s = char(int('a')+last) + s;
    n /= 26;
  }
  return s;
}

int main () {
  int veci[] = {3, 25, 26, 28, 51, 100};
  vi vec (veci, veci + SizeOfArray(veci));
  tr (vec, it) {
    //string s="";
    //numToStr (*it, s);
    cout << "\n " << *it <<" => " << numToStr (*it);  //, s); //s;
  }

  return 0;
}
