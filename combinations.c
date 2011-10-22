#include <stdio.h>


//void docombine (char in[], char out[], int len, int recurlen, int start);

int main() {
	printf ("\n%s", "vivek");
	return 0;
}


#if 0
void docombine (char in[], char out[], int len, int recurlen, int start)
{
	for (int i =0;i<len;i++) {
		out [recurlen] = in[i];
		out [recurlen+1] = '\0';
		cout << out;

		if (i<len-1)
			docombine (in, out, len, recurlen+1, start+1);
	}
}

int main {
	char *a = "abcd";
	char out[5];
	docombine (a, out, 4, 0, 0);
	return 0;
}

combinations.cpp:19: warning: extended initializer lists only available with -std=c++0x or -std=gnu++0x
combinations.cpp:20: error: expected primary-expression before 'char'
combinations.cpp:20: error: expected '}' before 'char'
combinations.cpp:20: error: expected ',' or ';' before 'char'
combinations.cpp:22: error: expected constructor, destructor, or type conversion before '(' token
combinations.cpp:23: error: expected unqualified-id before 'return'
combinations.cpp:24: error: expected declaration before '}' token
#endif


