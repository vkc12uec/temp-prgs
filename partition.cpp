#include <stdio.h>
/*

wrote a partition functino which is used, in Quicksort
*/

void swap (int &a, int &b) {
	int t = a;
	a = b;
	b = t;
}

void partition (int a[], int len) {
	int pivot = a[len-1];
	printf ("\npivot = %d", pivot);
	int lo = 0 , high = len-1;
	int p = 0;
	//return;
	
	for (int i = 0; i<len-1 ; i++) {
		if (a[i] < pivot) {
			swap (a[i], a[p]);
			p++;
		}
	}
	swap (a[p], a[len-1]);

	printf ("\n");
	for (int i=0;i<len;i++) {
		printf (" -- %d", a[i]);
	}
}



int main () {
	int a[] = { 1, 2, 3, 1, 55, 66, 3, 1,1,1,1,1, 4};
	//  -- 1 -- 2 -- 3 -- 1 -- 3 -- 1 -- 1 -- 1 -- 1 -- 1 -- 4 -- 66 -- 55


	partition (a, sizeof(a)/sizeof(int));
	printf ("\n%d", a[5]);
}
