#include<stdio.h>
int main () {
int *p = new int [4];
  printf ("\n%p", p);
p[0] = 11;
p[1] = 22;
p[2] = 33;
p[3] = 44;

for (int i =0; i<4;i++)
  printf ("\n%d", p[i]);

delete p;
//delete []p;

for (int i =0; i<4;i++)
  printf ("\n%d", p[i]);
return 0;

}
