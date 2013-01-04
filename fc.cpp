#include <iostream>
#include <stdio.h>
#include <vector>
#include <map>
#include <string.h>

using namespace std;

int main () {

  char nk[5];
  cin >> nk;

  int n = int(nk[0]) - int ('0');
  int k = int(nk[2]) - int ('0');

  cout << n << "--" << k;

  vector <int> pegs[k];
  vector <int> pegs_fc[k];

  char ic[2*n+100];
  char fc[2*n+100];
  map <int , int> hash;

  cin >> ic;
  cin >> fc;

  char *p = strtok (ic, " ");
  int rad = 1;
  while (p) {
    int peg = int(p[0]) - int('0');
    pegs[peg].push_back(rad++);
  }

  rad = 1;
  p = strtok (fc, " ");
  while (p) {
    int peg = int(p[0]) - int ('0');
    pegs_fc[peg].push_back(rad++);
  }

  return 0;

}
