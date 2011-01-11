#include <stdio.h>

#define _SHELL 1
#define TESTING 2
int main (){
#ifdef _SHELL
    printf ("\n sheell");
#endif

#ifdef TESTING
	printf ("\n testing");
#endif

return 0;
}
