
// Write a function which compress string AAACCCBBD to A3C3B2D
//
#include "topcoder_header.h"

string compress (string s) {
  char prev = s[0];
  int pc = 1;
  stringstream ss;

  for (int i=1; i<s.length(); i++) {
    if (s[i] == prev)
      pc++;
    else {
      ss << prev << pc;
      prev = s[i];
      pc = 1;
    }
  }

  ss << prev << pc;

  return ss.str();
}

int main () {
  string s[] = { "aaacccbbd", "abcd", "aaaa" };

  cout << "\n compressed = "<<compress(s[0]);
  cout << "\n compressed = "<<compress(s[1]);
  cout << "\n compressed = "<<compress(s[2]);

  return 0;
}
