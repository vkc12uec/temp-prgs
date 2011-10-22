#include<stdio.h>
#include<string.h>

int main () {
	int n = 13;
	char hash[2];
	int base = 8;

	memset (hash, 0, 2);

	printf ( "\n[%c]", hash[1]);

	char *c = &hash[1];
	int rem = 5;
	*c = *c | (1<<rem);

	printf ( "\n[%c]", hash[1]);
	printf ( "\n[%d]", hash[1]);
	return 0;

}
