#include <stdio.h>

#define SYMCAT(x)	#x

int main (){
	int memlen,i;
	char *c;

	c = SYMCAT(mem);
		printf ("\nc = %s ", c);
	i=1;
	switch (i){
	
	#define OP	\
		case 1:	\
		printf ("\none");	\
		break;

	case 1:
		printf ("\none one ");
		break;
	default:
		printf ("\ndef");
	}

	

return 0;
}
