/*
given a string write all the possible upper case and lower case strings of it. eg. given a string THE print tHE,ThE,THe,thE,The,tHe,the.....
give me the solution

*/

#include <iostream>
#include <string.h>
#include <stdio.h>
using namespace std;

void print_com (char *c, int start, int fillptr, char *fill) {
	if (start == strlen (c)) {
		fill[fillptr] = '\0';
		printf ("\nfill = %s", fill);
		//cout << "\nfill = "<<fill;
		return;
	}
	char op1 = c[start];
	fill[fillptr] = op1;
	print_com (c, start+1, fillptr+1, fill);
	fill[fillptr] = char (int (op1)-32);
	print_com (c, start+1, fillptr+1, fill);
}

int main () {

	char *c = "the";
	//const char *c = "THE";
	char fill[100];
	print_com(c, 0, 0, fill);
	return 0;
}


