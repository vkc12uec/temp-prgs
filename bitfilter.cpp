

/*
takes a bit patter and input array

1 means present 
0 means abset
*/

#include "topcoder_header.h"

int main () {
  int a[] = { 1, 2 ,3 ,4, 5};
  int len = SizeOfArray(a);

  //uint32 filter = 6;    //0110: opick elements from a[] with this pattern

  unsigned int f = 6;
  unsigned int mask=1, id=0;

  typedef unsigned int uint;

  vi vec;
  id = 0;

  while (f) {
    uint lastbit = f & 1;
    //cout << "\nlast bit = " << lastbit;

    if (lastbit)
      vec.pb (a[id]);
    
    ++id;
    f=f>>1;
  }

  printVector (vec);

  return 0;
}
