

/*
  insert spaces (as many possible) in a string word
  for e.g   INTERVIEW
  YOU CAN INSERT : 2^8 spaces in b/w
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


int main () {
  string w = "MADAM";
  int nSpaces = w.length()-1;
  print_splitted (w, nSpaces);

#if test
  string sp = "1467";
  string sps[] = { "1", "134", "18", "678"};

  for (int i = 0; i<4; i++)
    check (w, sps[i]);
    #endif

  return 0;
}
