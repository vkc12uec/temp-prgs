
// docombine
// print all subsets clear

//It's very simple to do this recursively. The basic idea is that for each element, the set of subsets can be divided equally into those that contain that element and those that don't, and those two sets are otherwise equal.

//For n=1, the set of subsets is {{}, {1}}
//For n>1, find the set of subsets of 1,...,n-1 and make two copies of it. For one of them, add n to each subset. Then take the union of the two copies.
//Edit To make it crystal clear:

//The set of subsets of {1} is {{}, {1}}
//For {1, 2}, take {{}, {1}}, add 2 to each subset to get {{2}, {1, 2}} and take the union with {{}, {1}} to get {{}, {1}, {2}, {1, 2}}
//Repeat till you reach n
//http://stackoverflow.com/questions/728972/finding-all-the-subsets-of-a-set

#include "topcoder_header.h"
vi empty(0);

void subsets (int N, vvi &res, int limit) {
  if (N==0) {
    res.pb(empty);
    return;
  }
  else if (N>0) {
    vvi tmp;
    subsets (N-1, tmp, limit);
    res=tmp;

    tr (tmp, it) {
      // *it is a vec
      if (sz(*it) == limit)
        continue;
      it->pb(N);
    }

    // union res and tmp
    tr (tmp, it) {
      res.pb(*it);
    }
  }
}

int main () {
  int N=5, limit=3;
  vvi res;
  vi empty(0);

  res.pb(empty);

  subsets (N, res, limit);

  tr (res, it) {
    printVector (*it);
    cout << "\n --";
  }

  return 0;
}

