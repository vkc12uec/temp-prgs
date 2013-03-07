
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
#if __linux
#include <climits>
#include <sys/dir.h>
#include <errno.h>
#include <sys/stat.h>
#endif

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
#define present(c,x) ((c).find(x) != (c).end())  // map | set
#define cpresent(c,x) (find(all(c),x) != (c).end())  // vector

template <typename T>
void printVector (vector <T> lis) {
  ostream_iterator<int> oit(cout, " ");
  copy(lis.begin(), lis.end(), oit);
}

template <typename T>
void printarr (T a[], int len) {
  cout << "\n";
  for (int i=0; i<len; i++)
    cout << " -- " << a[i];
}

template <typename T, size_t N>
inline size_t SizeOfArray( const T(&)[ N ] )
{ return N; }

template <typename T>
inline void printArr( T a[], int N ) {
  for (int i=0; i<N; i++)
    cout << "\n\t"<<a[i];
}

void revStr (string &sub) {
  sub = string ( sub.rbegin(), sub.rend() );
}

void getTokens (string input, vs &tokens) {
  istringstream iss(input);
  //vector<string> tokens;
  copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter<vector<string> >(tokens));
}


#endif
