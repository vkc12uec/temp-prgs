
//#include "topcoder_header.h"
// using stringstream constructors.
#include <iostream>
#include <sstream>
#include <vector>
#include <string>
using namespace std;
typedef vector<string> vs;


int main () {
  string s = "you are here";
  stringstream ss;
  ss << s;

  while (ss >> s) {
    cout << "\n s = ["<<s<<"]";
  }

  return 0;


#if 0
  vs vec;

  while (ss >> s) {
    vec.pb(s);
  }

  printVector (vec);
#endif
  return 0;
}
