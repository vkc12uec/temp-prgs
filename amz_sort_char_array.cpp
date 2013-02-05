
#include "topcoder_header.h"

//#define tr(c,i) for((typeof)(c.begin())i=c.begin(); i != c.end(); i++)

/*
   Given two arrays, array1 and array2
   using the rule of array1 to sort array2.
   Ex. 
   array1 = { B, A, C}
   array2 = {A, B, A, C, A, B, B, C, A}
output: sortedArray2 = {B,B,B,A,A,A,A,C,C}
*/

class Comp {
  private:
    mci mymap;

  public:
    Comp (const mci &m) : mymap(m) { };
    bool operator() (char c, char d) {
      return (mymap[c] < mymap[d]);
    }
};

int main () {
  string ord="bac";
  string inp="abacabbca";

  mci mymap;
  int cnt=0;

  tr (ord, it) {
    mymap[*it]=cnt++;
  }

  Comp co(mymap);

  sort (all(inp), co);

  cout << "\n new string = " << inp;

  return 0;

}
