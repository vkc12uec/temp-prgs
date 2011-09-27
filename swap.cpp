#include <cstdio>
    #include <iostream>
    
    using namespace std;
    
    #define SWAP(A, B) {struct tempStruct { char C[sizeof(A)];} swap_tmp;\
    swap_tmp = *( struct tempStruct*) &A;\
    *( struct tempStruct*) &A = *( struct tempStruct*) &B;\
    *( struct tempStruct*) &B = swap_tmp;}
   
   #if 0
	#define my(A, B) {\
	char *c1=&A;\
	char *c2=&B;\
	char tmp[sizeof(A)];\
	memcpy (c1, tmp, sizeof(A));\
	memcpy (c2, c1, sizeof(A));\
	memcpy (tmp, c2, sizeof(A));\
	}
	#endif

char *ss () {
	static char arr[]= " vivek";
	return arr;
}
    int main () {
       printf ("\n%s",ss());
 
			char a[] = "abc\nchh";
			printf ("\n%s", a);

return 0;
        char v1 = 'a';
        char v2 = 'b';    
        SWAP (v1, v2);
        cout << v1 << "   " << v2 <<"\n";
    
        float f1 = 45;
        float f2 = 123;
        SWAP (f1, f2);
        cout << f1 << "   " << f2 <<"\n";

		char s1[] = "hell";
		char s2[] = "vell";
		//my (s1, s2);

        cout << s1 << "   " << s2 <<"\n";
    }
