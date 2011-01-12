/*  quickSort.cpp
 *
 *  Bruce M. Bolden
 *  November 18, 1998
 */

#include <iostream>
#include <stdlib.h>
using namespace std;

typedef int aType;


    //  prototypes
void Quicksort( aType a[], int first, int last );
void  Swap( aType &v1, aType &v2 );
void  PrintArray( aType A[], int nElements );
int Pivot( aType a[], int first, int last );

void Select( aType a[], int first, int last , int k) {

	int piv = Pivot (a, first, last);
	cout << "\n piv index = "<< piv;
	PrintArray (a, 8);
	//PrintArray (a, sizeof(a)/sizeof(aType));

	if (piv == (k-1))
		cout << "\n found kth large at k = "<<k<< " value = "<< a[piv];
	else if (piv < (k-1))
		Select( a, piv+1, last, k);
	else 
		Select( a, first, piv-1, k);
}




int main()
{
	// [ 1, 2, 3, 4, 5, 7, 10, 13 ]
    aType testArray[] = { 7, 13, 1, 3, 10, 5, 2, 4 };
    int nA = sizeof(testArray)/sizeof(aType);

    cout << "nA: "  << nA << endl;

    cout << "Initial array contents:" << endl;
    PrintArray( testArray, nA );
	
	int k=5;		// 2nd largest
    Select( testArray, 0, nA-1 , k);
	exit(0);
    //Quicksort( testArray, 0, nA-1 );

    cout << "Final array contents:" << endl;
    PrintArray( testArray, nA );
}

/*  Quicksort:  Sort an array a, using the quicksort
 *  algorithm.
 */

void Quicksort( aType a[], int first, int last ) 
{
    int pivot;

    if( first < last ) {
        pivot = Pivot( a, first, last );
        Quicksort( a, first, pivot-1 );
        Quicksort( a, pivot+1, last );
    }
}


/*  Pivot:  Find and return the index of pivot element.
 */

int Pivot( aType a[], int first, int last ) 
{
    int  p = first;
    aType pivot = a[first];

	// { 7, 13, 1, 3, 10, 5, 2, 4 };
    for( int i = first+1 ; i <= last ; i++ ) {
        if( a[i] <= pivot ) {
            p++;
            Swap( a[i], a[p] );
        }
    }

    Swap( a[p], a[first] );

    return p;
}


/*  Swap:  Swap two item (by reference).
 */

void  Swap( aType &v1, aType &v2 )
{
    aType  tmpVal;

    tmpVal = v1;
    v1 = v2;
    v2 = tmpVal;
}


/*  PrintArray:  Print contents of an array.
 */

void  PrintArray( aType A[], int nElements )
{
    cout << "[ ";

    for( int i = 0 ; i < nElements ; i++ )
    {
        cout << A[i] ;
        if( i < nElements-1 )
           cout << ", ";
    }

    cout << " ] " << endl;
}
