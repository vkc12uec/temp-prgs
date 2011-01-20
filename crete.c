#include <stdio.h>

int create (int nargs, long args){

	unsigned long *a;

	a = (unsigned long*) &args;

	printf ("\n nargs=%d", nargs);
	printf ("\n pointer = %lu", a);

	
}
int main (){
	int i,j,k,kk;
	i=0, j=2, k=4;
	kk=create (i,j,k);
	return 0;

}
