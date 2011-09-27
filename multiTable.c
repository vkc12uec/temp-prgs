/* print multiplication table , space oriented */

#include<stdio.h>
#include<math.h>



int getDigits(double n);



int main()
{



//	printf("%d\n", (int)log10(x));



//	printf("%d\n",getDigits(1000));
	printMultTable(10,10);
}



void printMultTable(int n, int k)
{
	int i=1;
	int j=1;
	int* blocksize = malloc(sizeof(int)*k);
	for( i =1;i<=k;i++)
		blocksize[i]  = getDigits(n*k);
	
	for(i =1;i<=n;i++)
	{
		for(j=1;j<=k;j++)
		{
			printSpace(blocksize[k]-getDigits(i*j));			
			printf("%d",i*j);
			printSpace(1);



}
		printf("\n");
	}



}



void printSpace(int n)
{
	int i;
	for(i=0;i<n;i++)
		printf(" ");



}



int getDigits(double n)
{



return floor(log10(n)) + 1;



}



