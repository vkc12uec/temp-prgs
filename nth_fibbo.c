#include<stdio.h>

int main () {
	printf ("\nd=%d", fib(10));
	printf ("\nd=%d", fib(5));
	return 0;
}


int fib(int n)
    {
    int M[2][2] = {{1,0},{0,1}}
    for (int i = 1; i < n; i++)
        M = M * {{1,1},{1,0}};
    return M[0][0];
    }
