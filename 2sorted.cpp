#include <iostream>
using namespace std;

void prnt (int *t){
	cout <<"\n~~~~~~~~~~~~~~~";
	for (int i=0;i<11;i++)
		printf ("\n%d",t[i]);
}

void doAction (int *a, int *b) {
	int l1=5, l2=11;
	int tail=l2-1, ahead=0, bhead=0;

	printf ("\n%d=tail",tail);

	while ( ahead<l1 && b[bhead]) {
	//while ( ahead<l1 && bhead<l2) {
		if (a[ahead] < b[bhead]) {
			b[tail--]=a[ahead++];
		}
		else {
			b[tail--]=b[bhead++];
		}
	}
	if (ahead == l1)
		while (bhead < l2)
			b[tail--]=b[bhead++];

	if (bhead == l2)
		while (ahead < l1)
			b[tail--]=a[ahead++];
	
}

int main (){
	int a[]={1,3,5,7,9}, b[]={2,4,8,10,11,15,0,0,0,0,0};
	doAction(a, b);
	prnt (b);
	return 0;
}
