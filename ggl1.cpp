/*
   Sort an input string according to the given order string. There might be characters in input string that are not present in the order string and vice-versa. The characters of input string that are not present in the order string should come at the end of the output string in any order. Write code...

Example: Sort("abdcdfs","dacg");

output: ddacfbs
*/

#include <iostream>
#include <map>
#include <string.h>
#include "topcoder_header.h"
using namespace std;

void debug (char c) {
  cout << " -- "<<c;
}

class CompObj {
  map<char, int> order;

  public:
  CompObj(map<char, int> &o) : order(o) { };
  bool operator() (int i, int j) {
    return (order[i] < order[j]);
  }
};

int main () {
  string s = "abdcdfs";     // addcfsb
  string o = "dacgxyzp";

  map<char, int> order;

  for (int i=0; i<o.length(); i++)
    order.insert (pair<char, int> (o[i], i));

  int rightptr = s.length();

  for (int i=0; i<rightptr ; i++) {
    if (!present(order, s[i])) {
      swap (s[i], s[--rightptr]);
      --i;
    }
  }

  cout << "\nnew string = " << s << " rightptr " << rightptr;

  // sort from 0 to --rightptr
  vector <char> vc;

  for(int i=0; i<rightptr; i++)
    vc.pb (s[i]);

  for_each (all(vc), debug);

  CompObj co (order);
  //sort_helper (vc, order);
  sort (all(vc), co);

  for_each (all(vc), debug);

  return 0;
}

void sort_helper (vector <char> &vc, map<char, int> &order) {
  //sort (all(vc), 
}





#if oldcode
void resort (string inp, string order, map<char,int> &mymap) {
  char *ptr1, *ptr2;
  int l1=inp.length(), l2 = order.length();
  //int l1=strlen(inp), l2=strlen(order);
  map<char,int>::iterator it;
  int tail, head, i;

  /* clean inp of those alphabets which are not in order */
  tail = l1-1, head=0;
  for (i=0;i<l1;i++) {
    if (order.find(inp.at(i)) == string::npos) {
      // swap i and tail
      char ch = inp.at(i);
      char che = inp.at(head);
      inp.at(i)= che;
      inp.at(head)= ch;
      head++;
    }
  }

  cout << "\ncleaned = "<<inp;
}

void sort ( string inp, string order) {
  map<char,int> mymap;
  pair<map<char,int>::iterator,bool> ret;
  char *ptr;
  int i=0;

  for (i=0;i<order.length() ;i++)
    mymap.insert ( pair<char,int>( inp.at(i), order.length() -i));

  resort (inp, order, mymap);
}

int main () {
  string inp = "abdcdfs";
  string order = "dacg";
  //inp.at(2)='$';
  sort(inp, order);

  /*
     cleaned = bfscdad
     sorted = abdcdfs[bluegene@ubuntu:~/temp-prgs]$

*/
  cout << "\nsorted = "<<inp;
  return 0;
}

#endif
