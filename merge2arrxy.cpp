#include <iostream>
using namespace std;

void merge (int a[], int l1, int b[], int l2){
	int pa=0, pb=l1, fin=0;

	while ( pa < l1 && pb<l2) {
		if ( a[pa] < b[pb])
			b[fin++] = a[pa++];
		else
			b[fin++] = b[pb++];
		}

	if ( pb == l2)
		while (pa < l1)
			b[fin++] = a[pa++];

			return;
}


int main () {
	//int a[] = {2,-1,34,6,50}, b[] = {0, 0, 0, 0, 0, 1,23,-23,44, -15,77 };
	int a[] = {-1, 2, 6,36,50 }, b[] = {0,0,0,0,0, -23,-15, 1, 23, 44, 77};

	merge (a, 5, b, 11);
	
cout << endl;
	for (int i=0;i<11;i++)
		cout << "--->"<<b[i];

	return 0;
}
