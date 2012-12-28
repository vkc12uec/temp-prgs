
#include "topcoder_header.h"
/*
http://get-that-job-at-google.blogspot.in/search/label/Epic%20Systems
1) You are given a number n, write a function that prints next 10 terms of the 'Look and Say' sequence.
     Eg. If n = 1, then first term is 1, next term is 11, this is because "1 occurs 1 times",
           next term of 11 is 12 because "1 occurs 2 times",
           next term of 12 is 1121 because "1 occurs 1 times, 2 occurs 1 times"
           next term of 1112 is 1321 because "1 occurs 3 times, 2 occurs 1 times"
           next term of 1321 is 11312111 because "1 occurs 1 times, 3 occurs 1 times, 2 occurs 1 times, 1 occurs 1 times" and so on.
*/


typedef vector< ii > vii;
#include "sstream"

#define id(x) (int(x)-int('0'))

void look (string s, int c){
  if (!c || s=="") return;

  vii vec;
  string cn = s;
  int map[11] = {0};    // count mapping;

  char prev = s[0];
  //map[prev- int('0')] += 1;
  map[id(prev)] = 1;

  for (int i=1; i<s.length(); i++) {
    if (s[i] != prev) {
      ii t(id(prev), map[id(prev)]);
      vec.pb(t);
      map[id(prev)] = 0;
      prev = s[i];
    }
    map[id(prev)] += 1;
  //map[prev-'0'] += 1;
  }

  if (map[id(prev)] > 0) {
      ii t(id(prev), map[id(prev)]);
      vec.pb(t);
  }

  //printVector(vec);
  cout << "\n";
  string tmp = "";
  stringstream ss;

  tr (vec, it) {
    //cout << "\n first = " <<it->first << " | " << it->second;
    //cout << it->first<< " occures " << it->second << " times";
    ss << it->first << it->second;
  }

  cout << "\n pass " << ss.str();
  look (ss.str(), c-1);
}

int main () {
  int p=1;
  int c=10;

  //cout << int ('5') - int ('0');
  //return 0;

  string s = "1";   //"1121";

  look (s, c);

  return 0;
}
