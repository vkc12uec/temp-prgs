
#ifndef _HEADER_H
#define _HEADER_H

#include <iostream>
#include <string>
#include <stdio.h>
#include <sstream>
#include <vector>
#include <set>
#include <map>
#include <algorithm>
#include <stdlib.h>
#include <iterator>
#include <stack>
#include <climits>

using namespace std;

typedef vector<int> vi; 
typedef vector<string> vs; 
typedef vector<vi> vvi; 
typedef pair<int,int> ii; 
typedef map<int,char> mic; 
typedef map<char,int> mci; 
typedef map< ii, int > miii; 
#define sz(a) int((a).size()) 
#define pb push_back 
#define all(c) (c).begin(),(c).end() 
#define tr(c,i) for( typeof((c).begin()) i = (c).begin(); i != (c).end(); i++ )
#define present(c,x) ((c).find(x) != (c).end()) 
#define cpresent(c,x) (find(all(c),x) != (c).end()) 
//Here, 'present()' returns whether the element presents in the container with member function 'find()' (i.e. set/map, etc.) while 'cpresent' is for vector. 

template <typename T>
void printVector (vector <T> lis) {
  ostream_iterator<int> oit(cout, " ");
  copy(lis.begin(), lis.end(), oit);
}

template <typename T, size_t N>
inline size_t SizeOfArray( const T(&)[ N ] )
{ return N; }

template <typename T>
inline void printArr( T a[], int N ) {
  for (int i=0; i<N; i++)
    cout << "\n\t"<<a[i];
}


#endif
