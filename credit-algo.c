
#include <stdio.h>

int findq (int *a, int i, int j);

int main (){

	// cc array
	int a[] = {1, 2, 3, 4, 1, 3, 1, 2, 1, 1, 1, 5};
	//printf ("\n that faulty credit card no. is %d", findq(a, 0, 11));

	return 0;
}


//change int to void

int findq (int *a, int i, int j){

	int pivot = partition (a, i, j);
	
	findq (a, i, pivot);	
	findq (a, pivot+1, j);	
}
