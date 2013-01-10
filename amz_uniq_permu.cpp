
/*
generate permutations of a string without duplicates and without using hashtable to memorize the permutations.

*/

#include "topcoder_header.h"

void Swap (string &s, int i, int j) {
  char t = s[i];
  s[i] = s[j];
  s[j] = t;
}

void permu (string &s, int k, int m) {
  if (k==m) {
    cout << "\n -- " << s;
    return ;
  }

  char used[26]={0};

  for (int i=k; i<m; i++) {
    
    if (used[s[i]-'a'] == 1)
      continue;
    used[s[i]-'a'] = 1;  

    Swap(s, i, k);
    permu (s, k+1, m);
    Swap(s, i, k);
  }
}

int main() {
  string s = "aba";
  //string s = "eeabc";

  permu (s, 0, s.length());
  return 0;
}
