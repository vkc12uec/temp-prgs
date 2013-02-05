
/*
19 Answers
Given a string, you have remove duplicates from it in O(n) time and O(1) space.
*/

#include "topcoder_header.h"

int main () {
  string w = "vivekstrstrapple";    // viekstrapl
  char hash[26] = {0};
  string res;

  for (int i=0; i<w.length(); i++) {
    if (hash[int (w[i]) - int ('a')] != 1) {
      res += w[i];
      hash[int (w[i]) - int ('a')] = 1;
    }
  }

  cout << "\n res = " << res;
  return 0;
}
