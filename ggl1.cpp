/*
Sort an input string according to the given order string. There might be characters in input string that are not present in the order string and vice-versa. The characters of input string that are not present in the order string should come at the end of the output string in any order. Write code...

Example: Sort("abdcdfs","dacg");

output: ddacfbs
*/

#include <iostream>
#include <map>
#include <string.h>
using namespace std;

void resort (string inp, string order, map<char,int> &mymap) {
	char *ptr1, *ptr2;
	int l1=inp.length(), l2 = order.length();
	//int l1=strlen(inp), l2=strlen(order);
	map<char,int>::iterator it;
	int tail, head, i;

	/* clean inp of those alphabets which are not in order */
	tail = l1-1, head=0;
	for (i=0;i<l1;i++) {
		if (order.find(inp.at(i)) == string::npos) {
			// swap i and tail
			char ch = inp.at(i);
			char che = inp.at(head);
			inp.at(i)= che;
			inp.at(head)= ch;
			head++;
		}
	}

	cout << "\ncleaned = "<<inp;
}

void sort ( string inp, string order) {
	map<char,int> mymap;
	pair<map<char,int>::iterator,bool> ret;
	char *ptr;
	int i=0;

	for (i=0;i<order.length() ;i++)
		mymap.insert ( pair<char,int>( inp.at(i), order.length() -i));

	resort (inp, order, mymap);
}

int main () {
	string inp = "abdcdfs";
	string order = "dacg";
	//inp.at(2)='$';
	sort(inp, order);

/*
cleaned = bfscdad
sorted = abdcdfs[bluegene@ubuntu:~/temp-prgs]$

*/
	cout << "\nsorted = "<<inp;
	return 0;
}
