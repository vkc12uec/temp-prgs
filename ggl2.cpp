

/*
   insert spaces (as many possible) in a string word
   for e.g   INTERVIEW
   YOU CAN INSERT : 2^8 spaces in b/w

   2 methods :
    - find the indices as combinations like 1, 124, 135 ... and then insert spaces at those
      index

    - code like print_splitted2() function which recursively fill in vector
      and then combines back
   */

#include "topcoder_header.h"
#include "string.h"

void check (string s, string sp);

void DoCombine (string orig, char in[], char out [] , int length, int fillptr, int start)
{
  int i ;
  for (i = start; i < length; i++) {
    out[fillptr] = in[i];
    out[fillptr + 1] = '\0';
    check (orig, string (out));
    //printf("%s\n", out);

    if (i < length - 1) /* recurse if more letters in input */
      DoCombine(orig , in, out, length, fillptr +1 , i + 1);
  }
}

# if stale
void doCombine (char orig[], int origLen, char dum[], int dumLen, char out[], int fillptr, int base) {

  for (int id=base; id < dumlen; id++) {
    out[fillptr] = dum[id];
    out[fillptr+1] = 0;
    cout << "\n -- " << out;
  }

  if (base < dumLen - 1)
    doCombine (orig, origLen, dum, dumLen, out, fillptr+1, base+1);

}
#endif

void print_splitted (string s, int n) {

  string dummy = "";
  for (int i=0; i<n; i++)
    dummy += char(i + int('1'));

  cout << "\n dummy = [" << dummy << "]";

  //char *orig = s.c_str();
  //char *dum = dummy.c_str();
  char orig[n+1], dum[n];

  strcpy (orig, s.c_str());
  strcpy (dum, dummy.c_str());
  dum[n]=0;

  char out[n];
  int fill=0, start=0;

  //doCombine (orig, n, dum, n-1, out, fill, start);
  //DoCombine (string orig, char in[], char out [] , int length, int fillptr, int start)
  cout << "\n orig | dum | out " << orig <<" " <<  dum << " "<< out;
  DoCombine (orig, dum, out, n, 0, 0);
}

void check (string s, string sp) {
  string out = "";
  int spIndex=0;    // int(sp[spIndex]) - int ('0')

  for (int i=0; i<s.length(); i++) {
    if (i ==  (int(sp[spIndex]) - int ('0')) ) {
      out += '*';
      spIndex++;
    }
    out += s[i];
  }
  cout << "\n new str = " << out;

  /*
     for (int i=0; i<sp.length(); i++) {
     int insert = int (sp[i]) - int ('0');
  //cout << "\n insert = " << insert;

  }
  */
}

string helper (string w) {
  if (w.length() == 0)
    return string ("");

   for (int i=1; i<w.length(); i++) {
    string st = w.substr(0,i);
    //string ret = print_splitted1 (w.substr(i));
    }
}

void print_splitted2 (string w, vs &allComb) {

#if not_needed
  if (w.length() == 2) {
    allComb.pb (w.substr(0,1) + string ("#") + w.substr(1));
    cout << "\n\t\t2psace";
    return;
  }

  else if (w.length() == 1) {
    allComb.pb (w.substr(0,1)); //const char (w[0]));
    cout << "\n\t1space";
    return ;
  }
  #endif

  if (w.length() != 0)
    allComb.pb (w);

  if (w.length() == 1)
    return;

  //if (w.length() <= 1)  // redundant

  // foreach prefix of the string, get their suffixes vector, and then club
  for (int i=1; i<w.length() ; i++) {
    vs temp;
    string st = w.substr(0,i);
    print_splitted2 (w.substr(i), temp);

    tr (temp, it) {
      allComb.pb ( st+ string ("#") + *it);
    }

    temp.clear();
  }
}

void debug (string s) {
  cout << "\n s = " << s;
}


int main () {
  string w = "MADAM";
  int nSpaces = w.length()-1;
  //print_splitted (w, nSpaces);

  // http://www.careercup.com/question?id=14959971  checking amazon question (printing all ways splitted string)
  vs allComb;

  //cout << w.substr(0) << "\n";
  //cout << w.substr(1) << "\n";
  //cout << w.substr(2) << "\n";
  //cout << w.substr(3) << "\n";
  //cout << w.substr(4) << "\n";

  //print_splitted1 (w, allComb, 0);
 print_splitted2 (w, allComb);

 for_each (all(allComb), debug);

#if test
  string sp = "1467";
  string sps[] = { "1", "134", "18", "678"};

  for (int i = 0; i<4; i++)
    check (w, sps[i]);
#endif

  return 0;
}
