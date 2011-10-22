#include <stdio.h>

#define Ob(x)  ((unsigned)Ob_(0 ## x ## uL))
#define Ob_(x) (x & 1 | x >> 2 & 2 | x >> 4 & 4 | x >> 6 & 8 |		\
	x >> 8 & 16 | x >> 10 & 32 | x >> 12 & 64 | x >> 14 & 128)

char *
baseconv(unsigned int num, int base)
{
	static char retbuf[33];
	char *p;

	if(base < 2 || base > 16)
		return NULL;

	p = &retbuf[sizeof(retbuf)-1];
	*p = '\0';

	do {
		*--p = "0123456789abcdef"[num % base];
		num /= base;
	} while(num != 0);

	return p;
}

int main(){
	char c='A';
	
	//int i= Ob(65);

	printf ("\nhex = [%s]", baseconv(65, 2));

	//printf ("\nhex = [%d]", i);
	//Ob(65));

return 0;
}
