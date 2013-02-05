
// http://stackoverflow.com/questions/14131853/algorithm-needed-benelux-contest-2007

// not working but testing the recursive programming skill
// corect is 76 but its giving 64

#include "topcoder_header.h"

typedef struct s {
  int in;
  int maxout;
  int price;
  void disp() {
    cout << "\n "<<in<<" "<<maxout<<" "<< price;
  }
} sdata;

typedef vector <sdata> vsd;

int helper (vsd vec, int stid, int len, int remainLastState, int earned, int fill[], int fillptr) {
  static int maxret=INT_MIN;

  if (stid >= len){
    if (maxret < earned) {
      maxret = earned;
      cout << "\n\t\t maxret = "<< maxret << " earned = " << earned;
      printarr(fill, len);  //fillptr-1);
    }
      return 0;
  }

  int maxsell = vec.at(stid).maxout;
  int ncansell= vec.at(stid).in + remainLastState;
  int nlimitsell = min(maxsell,ncansell);
  int price=vec.at(stid).price;

  for (int i=0; i<= nlimitsell ; i++){
    fill[fillptr] = i;
    helper (vec, stid+1, len, nlimitsell-i, earned + (i*price), fill, fillptr+1);
  }   //for
}

int maxp (vsd vec) {
  //tr (vec, it) {
  //it->disp();
  //}

  int fill[6], fillptr=0;
  return helper (vec, 0, vec.size(), 0, 0, fill, fillptr);
}

int main () {
  vsd vec;
  sdata a;

  a.in=4,a.maxout=2,a.price=4;
  vec.pb(a);
  a.in=2,a.maxout=3,a.price=9;
  vec.pb(a);
  a.in=2,a.maxout=3,a.price=6;
  vec.pb(a);
  a.in=2,a.maxout=9,a.price=5;
  vec.pb(a);
  a.in=2,a.maxout=2,a.price=2;
  vec.pb(a);
  a.in=2,a.maxout=3,a.price=3;
  vec.pb(a);

  cout << "\n max p = " << maxp (vec);
  return 0;
}
