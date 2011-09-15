/*
	overload cout operator ... and see the default ctor for 
	working against array of objects...
*/

#include <iostream>
#include <stdio.h>
using namespace std;

class point {

	private:
		int a;
		int b;
	public:
		point (int x, int y) {
			a=x, b=y;
		}
		//: a(x) , b(y) { }
		// friend ostream &operator<<(ostream &out, Complex c)     //output

		friend ostream &operator<<(ostream &out, point p) {
			out<<"\nx = "<<p.a<<" y = "<<p.b;
			return out;
			//return out
		}

};

int main () {
	point p (0,1);
	cout << p;
	point pp[3];	// this is giving error compile...saying no compatible cstor found ..
	point pp[3] = {point(1,1), point (2,2), point(3,3)};		// this is working fine ...

	return 0;
}

