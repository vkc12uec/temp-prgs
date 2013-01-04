#include <iostream>
using namespace std;

class Cbankcus {
	private:
		int acno;
		int bal;

	public:
		Cbankcus (int a, int b) {
			acno=a;
			bal=b;
		}

		Cbankcus (Cbankcus &x) {
			acno=x.acno;
			bal=x.bal;
		}

		void operator = (Cbankcus x) {
			acno=x.acno;
			bal=x.bal;
		}

		bool operator == (Cbankcus x) {
			if (acno==x.acno && bal==x.bal) {
				cout << "\nperson x has same values as this";
				return 1;
			}
			else 
				return 0;
		}

		Cbankcus& operator+ (int x) {
			bal+=x;
			return *this;
		}

		void printinfo () {
			cout <<"\nacno = "<<acno<<" balance = "<<bal;
		}

};

//main (int n, char **aa) {exit(0);}
#define SWAP (A, B) \
	struct tempStruct { char C[sizeof(A)];} \
	swap_tmp; \
	swap_tmp = *( struct tempStruct*) &A; \
	*( struct tempStruct*) &A = *( struct tempStruct*) &B; \
	*( struct tempStruct*) &B = swap_tmp;

int main () {

int a[3][4][5];

a[2][3][4]=1;			
cout << "\n"<<a[2][3][4];

*(*(*(a+3)+4)+5)=2;
cout << "\n"<<a[2][3][4];

string s1="vivek", s2="amit";
SWAP (s1,s2);

cout<<"\n"<<s1<<"\n"<<s2;


//cout << "\n\vivek";

/*
int z=0, y;

for (y=1; y++<8;)
	z+=y;

printf ("\n%d", z);
*/

/*
char *x;
x="DATA";

printf ("\n%s",x);
*/

#if 0
int x= 0x1234, y=0x5555;

printf ("0x%04.4x\n", x|y);
printf ("0x%04.4x\n", x&y);
printf ("0x%04.4x\n", x^y);
printf ("0x%04.4x\n", ~x);
#endif
return 0;


short testarr[4][3] = { {1}, {2,3}, {4,5,6} };

cout <<sizeof (testarr);
return 0;

	int m = -14, n=6, o;

o = m% ++n;
n+=m++ - o;
m<<=(o^n) & 3;

//cout <<"\n"<<m<<"||"<<n"||"<<o;
cout<<m<<n<<o;

return 1;
}
#if 0
	Cbankcus x(1234, 20000);
	x.printinfo();
	Cbankcus y(x);
	y.printinfo();
	Cbankcus z=x;
	z.printinfo();
	if (z==x) {
		cout <<"\n damn you";
	}

	x=x+100;
	x.printinfo();

	return 0;
}
#endif
#if 0
class Boo
{
	int x;
  public:
    Boo( int i ){
		x=i;
	}
	void prnt(){	cout << x; }
};

int main () {
Boo BooObject = 10 ; // assigning int 10 Boo object
BooObject.prnt();
return 0;
}
#endif
