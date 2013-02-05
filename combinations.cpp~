/* program to print the combinations of 
an array

Task 2: change the code, so that to print only combinations of K items at a time. FB interview question.

*/

#include <stdio.h>
#include <iostream>
#include <string.h>
using namespace std;
//void docombine (char in[], char out[], int len, int recurlen, int start);


void DoCombine (char in[], char out [] , int length, int recursLev, int start, int limit) 
{ 
  int i ; 
  for (i = start; i < length; i++) { 
    out[recursLev] = in[i]; /* select current letter */ 

    //if (recursLev == limit) {
      out[recursLev + 1] = '\0' ; /* tack on NUL for printf */ 
      if (strlen (out) == limit)
        printf("%s\n", out); 
    //}

    if (i < length - 1) /* recurse if more letters in input */ 
        DoCombine(in, out, length, recursLev +1 , i + 1, limit); 
  } 
}


void docombine (char in[], char out[], int len, int recurlen, int start)
{
	for (int i =0;i<len;i++) {
		out [recurlen] = in[i];
		out [recurlen+1] = '\0';
		std::cout << out;

		if (i<len-1)
			docombine (in, out, len, recurlen+1, start+1);
	}
}

int main() {
	char a[] = "abcd";
	char out[5];
	DoCombine (a, out, 4, 0, 0, 2);
	return 0;
}

