
/*
google interview

You are given an array of n elements [1,2,....n]. For example {3,2,1,6,7,4,5}. Now we create a signature of this array by comparing every consecutive pir of elements. If they increase, write I else write D. For example for the above array, the signature would be "DDIIDI". The signature thus has a length of N-1. Now the question is given a signature, compute the lexicographically smallest permutation of [1,2,....n].

Here's an Example: Suppose if the input signature is DDIIDI Many Permutations are possible like 5324617, 4325617 But the lexicographically smallest permutation is 3214657.

Another one: If signature is IIID and n=5 lexicographically smallest permutation is 12354
http://learn.hackerearth.com/tests/7/

Step One: Take the permutation 1 2 3 .... n. For example if n=5 take permutation 1 2 3 4 5. Call It original sequence.

Step Two: Mark all the continuous occurrences of D in the given signature.

Step Three: Then for each continuous sequence of D, going from left to right reverse the strip corresponding to that in original sequence.Every time make the new sequence as original sequence.

Example Take the above case. Signature = DDIIDI , take original permutation as 1 2 3 4 5 6 7. Then for first continuous sequence DD reverse the strip 1 2 3 to 3 2 1 hence sequence becomes 3 2 1 4 5 6 7. Then for second sequence D reverse strip 5 6 to 6 5 hence sequence becomes 3 2 1 4 6 5 7. There is no continuous D left we are done and reached the answer. As coding practice try writing code for this problem 


My algo:
ddiidi
1234567 (initial mapping)

swap(i,i+1) if its 'd'. This swapping might cause frequent other swappings in left. 

Implement the Step algo given above.
*/

#include "topcoder_header.h"

void rev (string &s, int i1, int i2) {
  // real index are i1-1 and i2+1;
  //cout << "\n real indices " << i1-1 << " | " << i2+1;
  //cout << "\n st param = "<< s;

  string prev = s.substr(0,i1-1);
  string sub = s.substr(i1-1, i2+1-i1+1+1);
  string last = s.substr(i2+2);

  //tekst = string ( tekst.rbegin(), tekst.rend() );
  s = prev +string ( sub.rbegin(), sub.rend() ) + last;
}

int main() {
  string s = "ddiidi";
  string mix="";
  int len = s.length();
  int n=1;

  //s.insert (0,string("1"));
  //cout << s;
  stringstream ss;

  for(int i=1; i<=len+1; i++)
    ss << i;

  string incr = ss.str();
  cout << "\n " <<incr;

  int ins=0;
  for(int i=1; i<=len+1; i++) {
    s.insert (ins, incr.substr(i-1,1));
    ins+=2;
    }

  cout << "\n mix ="<< s;     //1d2d3i4i5d6i7
  mix = s;

  int cptr=1; //+2
  int iptr=0; //+2

  while (cptr <= mix.length()-1) {
    //longest d collection
    if (mix[cptr] == 'i') {
      cptr += 2;
    }
    else {
      int p=cptr;
      while (mix[p+2] == 'd') {
        p+=2;
      }

      // cptr and (p-2) r 2 indices
      rev (mix, cptr, p);
      cptr= p+2;
      cout << "\n inter mix --- " << mix;
      //return -1;
    }
  }

  return 0;



}
