
/*
   Write a program that is given an array of n characters that are in sorted manner.list all strings of length m in lexicographic order.
   */

#include "topcoder_header.h"
#include "string.h"
using namespace std;

void DoCombine (char in[], char out [] , int length, int fillptr, int start, int m)
{
  int i ;
  for (i = start; i < length; i++) {
    out[fillptr] = in[i]; /* select current letter */
    out[fillptr + 1] = 0 ; /* tack on NUL for printf */
    //printf("%s\n", out);
    if (strlen (out) == m) {
        cout << "\n " << out;
       // return;       NO RETURN IS NNEDED HERE ; deep thinking 
    }

    if (i < length - 1) /* recurse if more letters in input */
        DoCombine(in, out, length, fillptr +1 , i + 1 , m);
  }
}

void combine (char *a, int size, char *res, int fill, int m , int base) {

  for (int i=base; i<size; i++) {
    res[fill] = a[i];

    if (fill == m) {
      res[fill] = 0;
      cout << "\n r = " << res;
      return;
    }

    if (i < size - 1)
      combine (a, size, res, fill+1, m, i+1);
  }
}

int main () {
  char a[] = {'a', 'b', 'c', 'd', 'e', 'f'};
  
  int size = sizeof(a)/sizeof (char);
  int m = 4;
  char res[m+1];
  int fill=0, start = 0;

  char b[6];
  DoCombine (a, b, size, 0, 0, m);
  //combine (a, size, res, fill, m, start);

  //cout << size;
  return 0;
}
