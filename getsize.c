#include<stdio.h>

#define sizeof_macro(type_t) ((unsigned)((type_t *)0 + 1))

int main () {
	printf ("\n%d", sizeof_macro(char));
}

