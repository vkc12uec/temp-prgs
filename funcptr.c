#include <stdio.h>

int f (){
	printf ("\n good day");
	return 0;
}

int main (){
	int (*fadd)(void);

	fadd = &f;
	printf ("\nn add of func = [%p]", fadd);
	(*fadd)();
	return 0;
}
