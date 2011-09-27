
/*
prog to chec kif new calls the ctro for class
*/

#include <stdio.h>
class myc {
	int a;
	public :

	myc (int x) {
		a = x;
		printf ("\n : in ctor");
	}
};


int main () {
	myc *x = new myc (9);
	return 0;
}
