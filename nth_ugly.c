#include "topcoder_header.h"

#define bool int

/* Function to find minimum of 3 numbers */
unsigned min(unsigned , unsigned , unsigned );

/* Function to get the nth ugly number*/
unsigned getNthUglyNo(unsigned n)
{
  unsigned *ugly =
    (unsigned *)(malloc (sizeof(unsigned)*n));
  unsigned i2 = 0, i3 = 0, i5 = 0;
  unsigned i;
  unsigned next_multiple_of_2 = 2;
  unsigned next_multiple_of_3 = 3;
  unsigned next_multiple_of_5 = 5;
  unsigned next_ugly_no = 1;
  *(ugly+0) = 1;

  for(i=1; i<n; i++)
  {
    next_ugly_no = min(next_multiple_of_2,
        next_multiple_of_3,
        next_multiple_of_5);
    *(ugly+i) = next_ugly_no;                    
    if(next_ugly_no == next_multiple_of_2)
    {
      i2 = i2+1;       
      next_multiple_of_2 = *(ugly+i2)*2;
    }
    if(next_ugly_no == next_multiple_of_3)
    {
      i3 = i3+1;
      next_multiple_of_3 = *(ugly+i3)*3;
    }
    if(next_ugly_no == next_multiple_of_5)
    {
      i5 = i5+1;
      next_multiple_of_5 = *(ugly+i5)*5;
    }
  } /*End of for loop (i=1; i<;n; i++) */
  return next_ugly_no;
}

/* Function to find minimum of 3 numbers */
unsigned min(unsigned a, unsigned b, unsigned c)
{
  return min(a, min(b,c));
}

/* Driver program to test above functions */
int main()
{
  unsigned no = getNthUglyNo(150);
  printf(&quot;%dth ugly no. is %d &quot;, 150, no);
  getchar();
  return 0;
}

