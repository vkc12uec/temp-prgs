
#include <stdio.h>

struct foo 
{ 
char c; 
int i;
}; 

union bar 
{ 
char c; 
int i;
}; 

int perfectsquare(int num) {
	int i=1,count=0;
	printf("\n\n");
	while (i<=num/i) {
		if(num%i==0) {
			if(i==num/i) {
				printf("%d \n",i);
				count++;
			}
			else {
				printf("%d %d \n",i,num/i);
				count+=2;
			}
		}
		i++;
		printf("%d --my add--\n",i);
	}
	printf("\nNumber of factors=%d ",count);
	if (count==0)
		return 0;
	else
		return 1;
}

int main () {
	perfectsquare(196);

#if 0
	struct foo ff;
	union bar uu;

	printf ("\n%d -- %d", sizeof(ff), sizeof(uu));
	printf ("\n%d -- %d", sizeof(char), sizeof(int));
#endif
return 0;
}

