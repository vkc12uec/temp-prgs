#include <stdio.h>

#define pvkc(s,l)	printf("\n"#s":[%d] "#l, __LINE__)	//;	\
					printf("\n[%d]",l)
//#define pvkc (s, l) printf ("\n"#s"\n")			//#l)


int main (){
	pvkc ("fucker", "message");		//, __LINE__);
	return 0;
}
