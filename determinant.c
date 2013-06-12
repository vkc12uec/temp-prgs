//Program to find Determinant of a Matrix
//http://www.c.happycodings.com/Beginners_Lab_Assignments/code62.html

#include<stdio.h>
#include<conio.h>
#define LIMIT 10
void main()
{
  int chckdgnl();
  float deter();
  float a[LIMIT][LIMIT] = { {1,2,3}, {4,5,6}, {7,8,9} },value;
  int i,j,order;
  //clrscr();
  printf("Enter order of determent :");
  scanf("%d",&order);

  /*
  for(i=0;i<order;i++)
  {
    for(j=0;j<order;j++)
    {
      printf("Enter (%d,%d) element of the determent :",i+1,j+1);
      scanf("%f",&a[i][j]);
    }
  }
  */

  if(chckdgnl(a,order)==0)
    value=0;
  else
    value=deter(a,order);
  printf("Determinent Value :%d",value);
  getch();
}

float deter(float a[][LIMIT],int forder)
{
  printf ("\none call to deter");
  int i,j,k;
  float mult;
  float deter=1;
  for(i=0;i<forder;i++)
  {
    for(j=0;j<forder;j++)
    {
      mult=a[j][i]/a[i][i];
      //printf ("\n a[j][i] = %s a[i][i] = %s " , a[j][i] ,a[i][i]);
      for(k=0;k<forder;k++)
      {
        if(i==j) break;
        a[j][k]=a[j][k]-a[i][k]*mult;
      }
    }
  }
  for(i=0;i<forder;i++)
  {
    deter=deter*a[i][i];
  }
  return(deter);
}


int chckdgnl(float array[][LIMIT],int forder)
{
  int i,j,k;
  float nonzero;
  for(i=0;i<forder;i++)
  {
    if(array[i][i]==0)
    {
      for(j=0;j<forder;j++)
      {
        if(array[i][j]!=0)
        {
          k=j;
          break;
        }
        if(j==(forder)) //forder-1
          return(0);
      }
      for(j=0;j<forder;j++)
      {
        array[j][i]=array[j][i]-array[j][k];
      }
    }
  }
  return(1);
}

//http://www.cs.rochester.edu/~brown/Crypto/assts/projects/adj.html
double Determinant(double **a,int n)
{
   int i,j,j1,j2;
   double det = 0;
   double **m = NULL;

   if (n < 1) { /* Error */

   } else if (n == 1) { /* Shouldn't get used */
      det = a[0][0];
   } else if (n == 2) {
      det = a[0][0] * a[1][1] - a[1][0] * a[0][1];
   } else {
      det = 0;
      for (j1=0;j1<n;j1++) {
         m = malloc((n-1)*sizeof(double *));
         for (i=0;i<n-1;i++)
            m[i] = malloc((n-1)*sizeof(double));
         for (i=1;i<n;i++) {
            j2 = 0;
            for (j=0;j<n;j++) {
               if (j == j1)
                  continue;
               m[i-1][j2] = a[i][j];
               j2++;
            }
         }
         det += pow(-1.0,j1+2.0) * a[0][j1] * Determinant(m,n-1);
         for (i=0;i<n-1;i++)
            free(m[i]);
         free(m);
      }
   }
   return(det);
}

