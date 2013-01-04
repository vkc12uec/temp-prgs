
void findperm ( int a[] , int k, int m) {

	// int arrary
	// find perm from [k:m] of array a

	if (k==m)
		printwholeARRAY (a, m);

	for ( int i=k+1; k<m; k++) {
		swap (a[i], a[k]);
		findperm (a, k+1, m);
		swap (a[i], a[k]);
	}
}
