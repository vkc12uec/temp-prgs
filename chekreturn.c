#include<iostream>
#include <stdio.h>

int h (){
	int i=10;
	return i;
}

char *c (){
	char ch[] = "hello";
	return ch;
}

int main (){
	int k;
	char *cch;

	k = h();
	printf ("\n k=%d",k);

	cch=c();
	printf ("\n cch = %s", cch);

	
return 0;
}
