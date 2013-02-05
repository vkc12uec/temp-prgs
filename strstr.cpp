
#include "topcoder_header.h"
#include <cstring>

void reverse (char *p) {
  int len = strlen (p);
  char c;

  for (int i=0; i<len/2; i++) {
    c = p[i];
    p[i] = p[len-1-i];
    p[len-1-i] = c;
  }

  cout << p;
}

void BruteForce(char *x /* pattern */,
    int m /* length of the pattern */,
    char *y /* actual string being searched */,
    int n /* length of this string */)
{
  int i, j;
  printf("\nstring : [%s]"
      "\nlength : [%d]"
      "\npattern : [%s]"
      "\nlength : [%d]\n\n", y,n,x,m);


  /* Searching */
  for (j = 0; j <= (n - m); ++j)
  {
    for (i = 0; i < m && x[i] == y[i + j]; ++i);
    if (i >= m) {printf("\nMatch found at\n\n->[%d]\n->[%s]\n",j,y+j);}
  }
}


int main () {
  char *h = "goodboy";
  char *f = "dbo";

  reverse(h);

  char *c=h, *ff=f;
  int l1=strlen(h), l2=strlen(f);

//  BruteForce (f, l2, h, l1);

  int i=0, j=0,ci;

  for (i=0; i<=(l2-l1); i++) {
    for(j=0; j < l2 && c[i+j] == ff[j] ; j++);
  }

  cout << "\n j = " <<j;
  if (j>=l2)
    cout << "\nfound";

  cout << "\nl1 = " << l1 << " " << "l2= "<<l2;

  return 0;

  
}
