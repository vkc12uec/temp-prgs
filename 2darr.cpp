
#include <iostream>
using namespace std;

void mult (int a[][3], int len){
	for (int i =0; i< len ;i++)
	for (int j=0; j< len;j++)
		a[i][j]+=2;
}

int main () {
	int a[3][3] = {1,2,3,4,5,6,7,8,9};
	mult (a, 3);
	int len =3;

	for (int i =0; i< len ;i++)
	for (int j=0; j< len;j++)
		cout << "\t "<<a[i][j];
	return 0;
}
