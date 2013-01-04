#include <stdio.h>
typedef int STAT[1];

int main (){
	STAT s;
	*s=10;

	printf ("\n valye in stat = [%d] [%d] [%d] ", *s, (int)sizeof s, (int)sizeof *s);
	return 0;

}
