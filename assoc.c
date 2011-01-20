#include <stdio.h>
int main (){
	int x,y;
	x=5;
	y=(++x)*(++x);
	printf ("\ny=[%d]", y);
	x=5;
	y=x++*++x;
	printf ("\ny=[%d]", y);
	x=5;
	y=x++*x++;
	printf ("\ny=[%d]", y);
	return 0;

}
