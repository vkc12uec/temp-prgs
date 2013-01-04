#include<stdio.h>
#include<stdlib.h>

int main () {
  int **p;
  int m=3, i=0, j=0;
  
  p = (int **)(malloc (sizeof (int *)*m));
  for (i=0;i<m;i++)
    p[i] = (int *) malloc (sizeof(int) * m);

  for (i=0;i<m;i++)
    for (j=0;j<m;j++)
      p[i][j] = i+j;

  for (i=0;i<m;i++) {
    for (j=0;j<m;j++) {
      printf ("%d", p[i][j]);
    }
      printf ("\n");
   }

  return 0;
}
