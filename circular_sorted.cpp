#include <iostream>
using namespace std;

int searchincircularsorterlist(int* a,int len,int num) {
	int start=0,end=len-1,mid;
	while(start<end) {
		mid=(start+end)/2;
		if (num == a[mid]) {
			cout << "Number found: "<< num;
			return num;
		}

		if(num<a[mid]) {
			if(num<a[start] && a[start]<=a[start+1])
				start=mid+1;
			else
				end=mid-1;
		}
		else {
			if(num>a[end] && a[end-1]<=a[end])
				end=mid-1;
			else
				start=mid+1;
		}
	}

	if (start == end && num == a[start]) {
		cout << "Number found: "<< num;
		return num;
	}

	cout << "fuck u";
	return -1; //---to show that number was not found.
}


int cricBinsearch (int *a, int l, int h, int find) {
	if (h < l) return -1;

	int mid = (l+h)/2;

	if (a[l] < a[mid])	//sorted
	{
		if (find < a[mid]) 
			h = mid-1;
		else 
			l = mid+1;	// in bad part
	}
	else if (a[mid] < a[h])	//sorted
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
