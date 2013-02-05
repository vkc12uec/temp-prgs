#include <stdio.h>
void print_layer_top_right(int a[][4], int x1, int y1, int x2, int y2);
void print_layer_bottom_left(int a[][4], int x1, int y1, int x2, int y2);

int main(void)
{
       int a[5][4] = {
                       {1,2,3,4},
                       {5,6,7,8},
                       {9,10,11,12},
                       {13,14,15,16},
                       {17,18,19,20}
                   };

       print_layer_top_right(a,0,0,3,4);
}

//
// prints the top and right shells of the matrix
//
void print_layer_top_right(int a[][4], int x1, int y1, int x2, int y2)
{
      int i = 0, j = 0;

      // print the row
	  printf ("*");

      for(i = x1; i<=x2; i++)
      {
         printf("%d,", a[y1][i]);
      }

      //print the column
      for(j = y1 + 1; j <= y2; j++)
      {
         printf("%d,", a[j][x2]);
      }
	  printf ("*");

      // see if  we have more cells left
      if(x2-x1 > 0)
      {
          // 'recursively' call the function to print the bottom-left layer
          print_layer_bottom_left(a, x1, y1 + 1, x2-1, y2);
      }
}

//
// prints the bottom and left shells of the matrix
//
void print_layer_bottom_left(int a[][4], int x1, int y1, int x2, int y2)
{
       int i = 0, j = 0;

	  printf ("|");
       //print the row of the matrix in reverse
       for(i = x2; i>=x1; i--)
       {
               printf("%d,", a[y2][i]);
       }

       // print the last column of the matrix in reverse
       for(j = y2 - 1; j >= y1; j--)
       {
               printf("%d,", a[j][x1]);
       }

	  printf ("|");
       if(x2-x1 > 0)
       {
               // 'recursively' call the function to print the top-right layer
               print_layer_top_right(a, x1+1, y1, x2, y2-1);
       }
}

