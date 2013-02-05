

// abc, ced, dfg, gaa : they can be connected into string
// todo: code
// abc, ceg, gca, acc, caa
/*
   algo 1: make a graph of terminal nodes and find a directed cycle whose length = #strings

   algo 2: use a map with key=s[0] and value=s[last]
   then , starting from random word, keep on deleting from map the values as key
   if at last , size(map) == 0 , in cycle
   */

#include "topcoder_header.h"
typedef map<char, char> mcc;
#define IND(c) (int(c)-int('a'))

int main () {
  const char *strs[] = {"abc", "ceg", "gca", "acc", "caa"};
  vs inputs(0);
  inputs.pb("abc");
  inputs.pb("ceg");
  inputs.pb("gca");
  inputs.pb("acc");
  inputs.pb("caa");

  int keymap[26]={0};
  int valmap[26]={0};
  mcc mymap;
  int k, v;

  //cout << "\n a loca " <<IND('a');
  //cout << "\n a loca " <<IND('d');

  // fill map
  tr (inputs, it) {
    string s = *it;
    k=s[0], v=s[s.length()-1];

    if (!present(mymap,k)) {
      mymap[k] = v;
    }
    keymap[IND(k)]++;
    valmap[IND(v)]++;
  }

  // start from any random word
  srand(time(NULL));
  int r = rand()%sz(inputs);
  k = inputs[r][0];

  cout << "\n rand loca = "<<r;
  printarr(keymap, 26);
  printarr(valmap, 26);

  while (1) {
    if(present(mymap, k)) {
      v=mymap[k];
      cout << "\n K | V " << char(k) <<" | " << char(v);
      keymap[IND(k)]--;
      valmap[IND(v)]--;

      if (keymap[IND(k)] == 0 && valmap[IND(v)] == 0)
        mymap.erase(k);

      //assert(keymap[IND(k)] >= 0);
      //assert(valmap[IND(v)] >= 0);

      k=v;
    }
    else {
      cout << "\nmap absent: test size ?";
      break;
    }
  }

  if (sz(mymap) == 0) {
    cout << "\n perfect cycle";
    return 0;
  }
  else {
    cout << "\n smth bad";
  return -1;
  }
}
