
/*ceck size of struct and its padding */

#include <stdio.h>

struct t1 {
  char c;
  int x;
  double d;
};
struct t2 {
  char c;     // this is stored at 0th byte
  int x;
};
struct t3 {
  char c;
  char cc;
};


int main () {
  int s1 = sizeof (struct t1);
  int s2 = sizeof (struct t2);
  int s3 = sizeof (struct t3);

  printf ("\n%d|%d|%d", sizeof(char), sizeof(int), sizeof(double));
  printf ("\n%d|%d|%d", s1, s2, s3);

  struct t2 vt2;
  vt2.c = 'a';
  vt2.x=10;

  struct t2 *t = &vt2;
  char *first = (char*)t;
  printf ("\nfirst = [%c]", *first);

  return 0;

}
