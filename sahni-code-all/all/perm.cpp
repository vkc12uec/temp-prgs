// output all permutations of n elements

#include <iostream>
//#include "swap.h"
using namespace std;

void Swap (char &x, char &y)
{
    char temp;
    temp = x;
    x = y;
    y = temp;
}

template<class T>
void Perm(T list[], int k, int m)
{// Generate all permutations of list[k:m].
   int i;
   if (k == m) {// list[k:m] has one permutation, output it
                for (i = 0; i <= m; i++)
                   cout << list[i];
                cout << endl;
                }
   else  // list[k:m] has more than one permutation
         // generate these recursively 
         for (i = k; i <= m; i++) {
            Swap(list[k], list[i]);
            Perm(list, k+1, m);
            Swap(list[k], list[i]);
            }
}

int main(void)
{
   char a[] = {'1', '2', '3', '4'};
   int n = 4;
   cout << "The permutations of 123 are" << endl;
   Perm(a, 0, n-1);
   return 0;
}
