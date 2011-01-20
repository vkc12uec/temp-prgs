#include <stdio.h>

int main (){
	char *f = "xxl";
	FILE *fp;
	char buf[30];

	fp = fopen (f, "r");
	fseek (fp, 4, SEEK_END);

	fread (buf, 1, 10, fp);

	printf ("\n buf = [%s]", buf);

	fclose (fp);
	return 0;

	
}
