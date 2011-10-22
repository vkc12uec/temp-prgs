#include <stdio.h>
typedef struct pipePointers {
    int in;
    int out;
}pipePointers;

int main () {
	int *a;
	pipePointers pp;

	pp.in=4;
	pp.out=34;

	a=&pp.in;
	*a+=40;
	printf ("\n a = [%d]", pp.in);
	
	a=&pp.out;
	*a+=40;
	printf ("\n a = [%d], hello [%d] ", pp.out, __LINE__);

return 0;

}
