#include <stdio.h>

int main () {
	int x,y;
	x=0,y=0;
	printf ("\n%d", x||y);
	
	x=0,y=1;
	printf ("\n%d", x||y);
	x=1,y=0;
	printf ("\n%d", x||y);
	x=1,y=1;
	printf ("\n%d", x||y);
	return 0;
}

