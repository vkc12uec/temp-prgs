/*
 * http://get-that-job-at-google.blogspot.com/2012/12/epic-systems-test.html?showComment=1356570641919
 *
4) You are given 2 strings, say A and B. Convert a string A to string B using adjacent swaps of characters in A. Give the intermediate series of strings produced. Display an error if the A can't be converted to B.

    Eg. A = "DUM", B = "MUD", DUM -> DMU -> MDU -> MUD

instead of doin swaps, do right circular rotate
 * 
 */

#include "topcoder_header.h"

void swap (string &s, int pj, int j) {
  char ch = s[pj];
  s[pj] = s[j];
  s[j] = ch;
}

  /* this way is not reqd.
  int f=from;
  char sav = s[from];

  while (f != moveto) {
    s[f] = s[f-1];
    --f;
  }

  s[f] = sav;
  */

void swaps (int moveto, int from, string &s) {
  // move s[j] to s[i] using swaps
  if (!from) return;

  int pfrom=from-1;

  while (pfrom >= moveto) {
    swap (s, pfrom, pfrom+1);
    cout << "\t --> "<< s;
    --pfrom;
  }
}

int main () {
  string s1="dum", s2="mud";

  for (int i=0; i<s2.length(); i++) {
    // search for s2[i] in s1
    // move that char in s1 using swaps to i
    int j=i;
    for (; j<s1.length(); j++)
      if (s1[j] == s2[i])
        break;

    if (j == s1.length()) {
      cout << "\n Not possible ";
      return -1;
    }
    
    cout << "\n i | j " << i << " | " << j;
    swaps (i, j, s1);
    cout << "\n after swaps, new string = " << s1;
    //return -1;
  }

  //cout << "\n s1 == " << s1;

  return 0;
}
