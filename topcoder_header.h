
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
//#include <boost/algorithm/string.hpp>

using namespace std;
//using namespace boost;

typedef vector<int> vi; 
typedef vector<vi> vvi; 
typedef pair<int,int> ii; 
typedef map<int,char> mic; 
typedef map<char,int> mci; 
#define sz(a) int((a).size()) 
#define pb push_back 
#define all(c) (c).begin(),(c).end() 
//#define tr(c,i) for(typeof((c).begin() i = (c).begin(); i != (c).end(); i++))
#define tr(c,i) for( typeof((c).begin()) i = (c).begin(); i != (c).end(); i++ )
#define present(c,x) ((c).find(x) != (c).end()) 
#define cpresent(c,x) (find(all(c),x) != (c).end()) 
//Here, 'present()' returns whether the element presents in the container with member function 'find()' (i.e. set/map, etc.) while 'cpresent' is for vector. 

#endif
