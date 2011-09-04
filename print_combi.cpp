/*
	given a no. N and an array of small nos.
	print the combinataions which give sum = N

	1st method = done by all possible pairs of combinations
	2nd method = could it be dynamic programmming ?

*/


#include <stdio.h>
using namespace std;

void print_arr (int *n, int len) {
	printf ("\n");
	for(int i=0;i<len;i++)
		printf (" -- %d", n[i] );
		//cout << " --- " << n[i];
}

int len = 8;

int print_combi (int a[], int start, int val, int fill[], int fillptr );

int main () {
	int a[] = {2,14, 6, 18, 1, 5, 8, 10};
	int N = 20;

	int fill[len];
	for (int i=0;i<len;i++)
		fill[i] = 0;
		//fill[i] = -2;
	int fillptr=0;

	print_combi (a, 0, N, fill, fillptr);
	return 0;
}

int print_combi (int a[], int start, int val, int fill[], int fillptr ) {
	// base condi.
	if (val == 0) {
		printf ("\n WOW val = 0");
		return 1;
	}
	else if (start == (len)) {
		return -1;
		// can achieve the sum
	}
	
	// take the option
	fill[fillptr] = a[start];
	int ret = print_combi (a, start + 1, val - a[start], fill, fillptr+1);
	if (ret == 1)
		print_arr (fill, len);
	
	// dont take that option
	fill[fillptr] = 0;
	//fill[fillptr] = -1;
	ret = print_combi (a, start + 1, val, fill, fillptr+1);
	if (ret == 1)
		print_arr (fill, len);
	
	return 0;	// is thi condi. useful ?
}
