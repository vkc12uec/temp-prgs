#include <stdio.h>
#include <string.h>

int main (){

	char A[]="abc";
	char B[]="ABC";
	char C[]="123";
	char arr[4];

	int i,j,k;

	for(i=0;i<3;i++)
		for(j=0;j<3;j++)
			for(k=0;k<3;k++)
				{
					arr[0]=A[i];
					arr[1]=B[j];	//[i];
					arr[2]=C[k];	//A[i];
					arr[3]=0;


					/*strcpy(arr,A[i]);
					strcat(arr,B[j]);
					strcat(arr,C[k]);*/

					printf ("\n str=(%s)",arr);
				}
	return 0;
}
