#include <stdio.h>

int main(){
	char buf[80];

	sprintf (buf, "\n"
			"a count=[%d]"
			"b count=[%d]", 10,20);
	
	printf ("\ndamn u [%s]",buf);

	sprintf (buf, "\n	\
		\a count=[%d]
		\b count=[%d]" , 10,20);
	
	printf ("\ndamn u [%s]",buf);

	return 0;

}
