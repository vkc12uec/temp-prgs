/* Enter your code here. Read input from STDIN. Print output to STDOUT */
#include <iostream>
#include <vector>
using namespace std;

string transform (string s) {
  int charcount = 0;
  char oldchar = s[0];
  charcount = 1;
  string transformed = "";

    for (int i=1; i<s.length();i++){
      if (s[i] == oldchar) {
        charcount++;
      }
      else {
        transformed += oldchar;
        transformed += char ('0') + charcount;
        oldchar = s[i];
        charcount = 1;
      }
    }
    return transformed;
}

int main () {
  string s = "bcabccaab";
  cout << transform(s);
  return 0;
}


