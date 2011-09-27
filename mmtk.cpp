int cricBinsearch (int *a, int l, int h, int find) {
	if (h < l) return -1;

	int mid = (l+h)/2;

	if (a[l] < a[mid])  //sorted
	{
		if (find < a[mid])
			h = mid-1;
		else
			l = mid+1;  // in bad part
	}
	else if (a[mid] < a[h]) //sorted
	{
		if (find > a[mid])
			l = mid+1;
		else
			h = mid-1;
	}
	return cricBinsearch (a, l, h, find);
}

int main () {
	int a [] = {4, 5 , 6, 7, 8, 9, 1, 2,3};
	int find = 3;

	if (searchincircularsorterlist(a,9, find) == 1)
		cout << "\nfound";
	//if (cricBinsearch(a, 0, 8, find) == 1)
	else cout << "\nnot -found";

	return 0;
}

