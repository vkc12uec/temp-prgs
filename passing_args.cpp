#include "stdafx.h"
#include "iostream"
#include "vector"
#include "queue"
#include "iostream"
#include "map"
#include "string"
#include "algorithm"
#include <stdlib.h>
#include <iterator>
#include <stack>
#include <sstream>
#include "time.h"


void testPassing() {
  vvi tmp;
  int c=100;

  for (int i=0; i<c; i++) {
    vi t;
    for (int ij=0; ij<c; ij++) {
      t.pb (ij);
    }
    tmp.pb (t);
  }

  long    i = 600000L;
  clock_t start, finish;
  double  duration;

  start = clock();
  pass1 (tmp);
  finish = clock();
  cout << "\n 1 " << ( (double)(finish - start) / CLOCKS_PER_SEC );

  start = clock();
  pass2 (tmp);
  finish = clock();
  cout << "\n 2 " << ( (double)(finish - start) / CLOCKS_PER_SEC );
}

void pass1 (vvi tmp) {
  cout << "\n in func ";
}

void pass2 (const vvi &tmp) {
  cout << "\n in func ";
}
