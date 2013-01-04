#include <iostream>
#include <stdlib.h>
using namespace std;

void printarr (int *a, int len);

void quicksort (int a[] , int lo, int high) {
	int i, j, k, mid, tmp;
	i=lo, j=high;
	mid = (lo+high)/2;
	cout << "\nprint a[mid] = "<< a[mid];

	while (i<=j) {
		while (a[i]<a[mid]) i++;
		while (a[j]>a[mid]) j--;

		if( i<=j ) {
			tmp = a[j]; a[j] = a[i]; a[i] = tmp;
			i++, j--;
		}
	}
	printarr(a, 5);
	exit(0);

	if (j>lo) quicksort (a, lo, j);
	if (i<high) quicksort (a, i, high);
}

void printarr (int *a, int len) {
	cout << "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n";
	for (int i=0;i<len;i++)
		cout<<" ## "<<a[i];
}

int main () {
	int a[] = {5, 1, 12, -5, 16};
	quicksort (a, 0, 4);
	printarr (a, 5);
	return 0;
}

/*
print a[mid] = 12

 ## 5 ## 1 ## -5 ## 12 ## 16

*/
