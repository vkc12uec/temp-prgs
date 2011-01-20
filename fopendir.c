#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

void parse (char *f, char **dirs){	//char *dir, char *fname){
	char *p;
	int i=0;
	//char dirs[10][10];

	printf ("\nf = [%s]", f);
	p = strtok (f, "/");
	printf ("\np = [%s]", p);
return ;

	while (p != NULL){
		printf ("\np = [%s]", p);
		strncpy (dirs[i++], p,strlen(p));
		p = strtok (NULL, "/");
	}
}

int main (){
	char f[] = "a/b/cfile";
	FILE *fp;
	int ret, i=0, j=0;
	char *p;
	char dirs[10][10];	
	char whole [100];
	char delims[] = "/";

	whole[0]='\0';
    printf ("\nf = [%s]", f);

    p = strtok (f, "/");

    while (p != NULL){
	printf ("\nff = %s", f);
        printf ("\np = [%s], len = %d", p, strlen(p));
        strcpy (dirs[i++], p);
        p = strtok (NULL, "/");
    }

	printf ("\ni= %d", i);

	for (j=0;j<(i-1);j++){			// leave the last filename
			strcat (whole, dirs[j]);
		printf ("\n whole after cat = [%s]", whole );
				ret = mkdir (whole, S_IRWXU);
					perror("mkdir");
			strcat (whole, delims);	//'/');
}

	// dirs [0 to i-2] are the dirs

return 0;

	/*fp = fopen (f, "w");
	if (fp != NULL)
		//printf ("\nsuccess");
	else 
		//printf ("\nfail");
	*/

	//int mkdir (const char *filename, mode_t mode)
	//ret = mkdir (f, S_IWRITE);
	ret = mkdir ("a", S_IRWXU);
            perror("mkdir");
/*
            if (errno == ENOBUFS)
                continue;
 */           //exit(1);

	if (ret == -1) 
		printf ("\nfail mkdir\n");

	ret = mkdir ("a/b", S_IRWXU);
		perror("mkdir1");
	
return 0;
}
