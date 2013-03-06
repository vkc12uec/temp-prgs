
#include "topcoder_header.h"

/*
   Sample Input #01:

   6 4
   4 2 4 3 1 1
   1 1 1 1 1 1

*/

#define FLU cout.flush ();return ;

void make_state (vvi &tempSorted, int k, string tmp) {
  vs vec;
  getTokens (tmp, vec);
  cout << "\n tmp vec split " ;

  tr (vec, it) {
    cout << "\n \t " << *it;
  }

  int ith=1;
  tr (vec, it) {
    int pegno = (*it)[0] - char ('0');
    tempSorted[pegno].pb (ith);
    ith++;
  }

  tr (tempSorted, it) {
    sort(all(*it), std::greater<int>());
  }
}

int main () {
  int n,k;
  string start, end, tmp;
  char line[1024]={'\0'};
  vvi vec;

  cin >> n >> k;

  vvi init(k+1, vi(0)), term(k+1, vi(0));   // kpegs   , ints sorted front to top

  cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(init, k, tmp);

  //cout << "\n mid ";

  tmp="";
  //cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(term, k, tmp);

  // test init state
  tr (init, it) {
    printVector (*it);
    cout << "\n -- \n";
  }
  tr (term, it) {
    printVector (*it);
    cout << "\n ** \n";
  }

  bfs (init, term);
  return 0;
}

void bf(

