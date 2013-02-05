
/*
# amazon (trick, thought)
given an ASCII string, return the longest substring with unique characters. Ex: dabcade => Ans: bcade.

*/

#include "topcoder_header.h"
#include "string.h"
#include "limits.h"
using namespace std;

int main () {
  string s ("dabcade");
  mci posi;

  int longest = INT_MIN +1, prev = 0, curr=0;

  //   for (int i=0; i< s.length(); i++) {

  for (; curr<s.length(); curr++) {
    if (!present (posi, s[curr]))
      posi.insert (pair<char, int> (s[curr], curr));
    else {
      int foundat = posi[s[curr]];
      int len = curr-prev+1;

      curr = foundat+1;
      prev = curr;

      if (longest < len) {
        cout << "\n change positions to start | end " << prev << " | " << curr-1;
      }
      longest = max (longest, len);
      posi.clear();
    }
}

cout << "\n logn = " << longest;

return 0;

}
