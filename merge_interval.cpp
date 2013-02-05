
/*
http://basicalgos.blogspot.com/2012/03/24-merging-overlapping-intervals.html

ssee their solution

*/

#include "topcoder_header.h"

struct Interval {
  int st;
  int end;
  Interval (int s, int e) : st(s), end(e) { }

  //ostream& operator<<(ostream &out, Interval *i) {
    //out << "\n start = " << i->st << " end = " << i->end;
    //return out;
  //}

};

typedef vector<Interval*> vit;
typedef struct Interval myInt;

void debug (myInt *i) {
  cout << "\n s = "<<i->st << " e = " << i->end;
}

myInt * mergeInt (myInt *i1, myInt *i2) {
  assert (i1);
  assert (i2);

  int s1=i1->st, e1 = i1->end;
  int s2=i2->st, e2 = i2->end;

  if (s2 > e1)
    return 0;
  else if ( s1 < s2 && s2 < e1) {
    if (s1 < e2 && e2 <= e1)      // subset
      return i1;
    else {
      return new myInt (s1, e2);
    }
  }
}

int main () {
  vit vec;

  vec.pb (new struct Interval (1,4));
  vec.pb (new struct Interval (6,10));
  vec.pb (new struct Interval (14,19));

  myInt *merge = new myInt (13,17);

  int s = merge->st, e = merge->end;
  int ps, pe;
  vit::iterator psitr;
  int s1, e1;

  ps=pe=0;

  vit resvec;
  int nitems=0;

  tr (vec, it) {
    nitems++;
    myInt *t = mergeInt (*it, merge);

    if (t == 0) {
      resvec.pb (*it);
      continue;
    }
    else if (t == *it) {
      resvec.pb (*it);
      break;    // subset
    }
    else {
      // new interval
      merge = t;
    }
    }   //tr

    
  }

  for_each (all(vec), debug);

  return 0;
}
