
/*
http://tanin.nanakorn.com/m/unlearn_math
Given a string, for example, aa-(1,2)-(4,5)-xx, generate
aa-1-4-xx
aa-1-5-xx
aa-2-4-xx
aa-2-5-xx
*/

#include "topcoder_header.h"

void pprint (vvi matrix, int st, vi &fill) {
  if (sz(fill) == 2) {
    cout << "\n --- ";
    printVector (fill);
    cout << "\n ####  ";
    return ;
  }

  //vi working_vec = matrix[st];

  tr(matrix[st], it) {
    fill.pb(*it);
    pprint (matrix, st+1, fill);
    fill.pob();
  }
}

int main () {
  vvi matrix;

  vi t;
  t.pb(1);
  t.pb(2);
  matrix.pb(t);

  t.clear();

  t.pb(3);
  t.pb(4);
  matrix.pb(t);

  vi fill;

  pprint (matrix, 0, fill);
  return 0;
}
