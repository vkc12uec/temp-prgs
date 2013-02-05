/*
facebook telephonic
no. of ways to reach S if u can win 2, 3 ,5 one at a time

  if 2x + 3y + 5z = s
  we need integral solutions to above, then recursive approach wont help us

*/

#include<stdio.h>
#if 0
bool now (int s, int &c) {
  if (s <= 1)
    return false;
  if (s == 2) {
    return 
  }
    
}
#endif

int main () {
  
  int c = 0, s = 20;
   
  for (int i = 0; i<= s/2; i++) {
    for (int j = 0; j<= s/3; j++) {
      int x = 2*i;
      int y = 3*j;
      int r = s - (x+y);
      if (r < 0)
        break;

      if ((s - (x+y)) % 5 == 0)
        {
        c++;
        printf ("\n x | y | z = %d | %d | %d", i, j, r/5);
        break;    // thr will be onle one such combination so quick exit, x y z
        }
    }
  }

  printf ("\n no. of ways = %d", c);
  return 0;
}
