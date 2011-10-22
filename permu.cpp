
#include <stdio.h>
#include <string.h>
using namespace std;

void Perm(int list[], int k, int m);
void Swap (int &a , int &b);
void permutate_char( char* str, int index );

void swap (char &c, char &d) {
	char t=c;
	c=d;
	d=t;
}

int touched[10] = {0};

int main () {
	//int a[] = {1, 4, 3, 4};	//, 5,6 };
	char c[] = "abca";
	//{ 'a', 'b', 'c', 'd'};
	permutate_char (c, 0);
	return 0;

	int a[] = {1, 1, 3};
	Perm (a, 0, 2);
	//Perm (a, 0, 3);
	return 0;

}

void Perm(int list[], int k, int m)
{// Generate all permutations of list[k:m].
   int i;
	static int lastChar = -1;
   if (k == m) {// list[k:m] has one permutation, output it
                for (i = 0; i <= m; i++)
                   printf ("%d --", list[i]);
                printf ("\n");
                }
   else  // list[k:m] has more than one permutation
         // generate these recursively
         for (i = k; i <= m; i++) {
		 	if (lastChar == list[k])
				continue;
			else 
				lastChar = list[k];

		 	//if (list[k] == list[i])
				//continue;
            //if (list[k]!= list[i])
				Swap(list[k], list[i]);
            //if (list[k]!= list[i])
				Perm(list, k+1, m);
            //if (list[k]!= list[i])
				Swap(list[k], list[i]);
            }
}

void Swap (int &a , int &b) {
	int t = a;
	a=b;
	b=t;
}

#if 0
void findperm ( int a[] , int k, int m) {

	// int arrary
	// find perm from [k:m] of array a

	if (k==m)
		printwholeARRAY (a, m);

	for ( int i=k+1; k<m; k++) {
		swap (a[i], a[k]);
		findperm (a, k+1, m);
		swap (a[i], a[k]);
	}
}
#endif

#if 0
void permutate_char( char* str, int index )
{
if( index == strlen(str) )
{ // We have a permutation so print it
printf(str);
return;
}

char used[255];
bzero(used, sizeof(used));

int i;
for( i = index; i < strlen(str); i++ )
{
if( (int)used[arr[i]] != 0)
{
continue;
}

used[arr[i]] = 1;

swap( str[index], str[i] ); // It doesn't matter how you swap.
permutate_char( str, index + 1 );
swap( str[index], str[i] );
}
}

#endif


void permutate_char( char *str, int index )
{
    int i = 0;
    //static char lastChar = 0;
	char used[255];
	memset (used, 0, 254);

    if( index == strlen(str) )
    { // We have a permutation so print it
        printf("\n%s = ",str);
        return;
    }
    for( i = index; i < strlen(str); i++ )
    {
		if( (int)used[str[i]] != 0)
			continue;
		used[str[i]] = 1;

        swap( str[index], str[i] ); // It doesn't matter how you swap.
        permutate_char( str, index + 1 );
        swap( str[index], str[i] );
    }
} 

//permutate( sort("Hello World"), 0 );

