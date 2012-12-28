//Program to find Determinant of a Matrix
//http://www.c.happycodings.com/Beginners_Lab_Assignments/code62.html

#include<stdio.h>
#include<conio.h>
#define LIMIT 10
void main()
{
  int chckdgnl();
  float deter();
  float a[LIMIT][LIMIT],value;
  int i,j,order;
  //clrscr();
  printf("Enter order of determent :");
  scanf("%d",&order);
  for(i=0;i<order;i++)
  {
    for(j=0;j<order;j++)
    {
      printf("Enter (%d,%d) element of the determent :",i+1,j+1);
      scanf("%f",&a[i][j]);
    }
  }

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

