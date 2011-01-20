#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <vector>
using namespace std;

class myclass {
	private:
		int age;

	public:
		myclass (int x) {
			age=x;
			}
		void prnt () {
			cout << "\nage = "<< age;
		}
};

int main () {
	//myclass *m = new myclass [100];

myclass mmtk[3] = {1, 2 ,3 };

mmtk[1].prnt();
return 0;
//myclass mmtk[3] = {myclass(1), myclass(2), myclass(3)};

//myclass *mmt = new myclass [10] (100);

	myclass *m = new myclass (10);
	myclass mm = myclass(*m);
	mm.prnt();

	myclass arr[3] = {myclass(130), myclass(310), myclass(103)};

	for (int i=0;i<3;i++)
		arr[i].prnt();

	//std::vector<myclass> object_name(4, 405);
	
	myclass *mp[4];
	for (int i=0;i<4;i++)
		mp[i] = new myclass (10+i);
/*
	void *p = malloc ( sizeof(myclass*) * 100);

		myclass *t = (myclass*)p;

	for (int i=0;i<100;i++) {
		*(t)++ = new myclass (10);
	}
		
	//m->prnt();
	//myclass m;
*/
	return 0;
}
