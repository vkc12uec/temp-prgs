/* fgets example */
#include <stdio.h>

int main()
{
   FILE * pFile;
   char mystring [100];

   pFile = fopen ("myfile.txt" , "r");
   if (pFile == NULL) perror ("Error opening file");
   else {
	while ( fgets (mystring , 100 , pFile) != NULL ) {
     //if ( fgets (mystring , 100 , pFile) != NULL )
   //    puts ("[[");
		puts (mystring);
     //  puts ("]]");
	}
     fclose (pFile);
   }
   return 0;
}
