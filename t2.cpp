#include <iostream>

using namespace std;

#define OWINS	{ \
				cout << "\n O wins";\
				return;\
				}

#define XWINS	{ \
				cout << "\n X wins";\
				return;\
				}

#define PLAYON { \
				cout << "\n play on";\
				return;\
				}

#define DEAD { \
				cout << "\n deadlock ";\
				return;\
				}
			

void function (int [][3], int );

int main () {

	int a[3][3] = {{1, 0, 0}, {0, 0, 1}, {1, 1, 0} } ;
	//int a[3][3] = {{0, 0, 1}, {0, 1, 0}, {1, 1, 0} } ;
	function (a,3);
}

void function (int a[][3], int len) {

	/*(int count [12] = {0};
	int czero=0, cone=0;
	int rzero=0, rone=0;*/
	int sumrow, sumcol;

// O -> 0	X -> 1	Blank -> 10

	for (int i=0;i <len ;i++) {				// blanks . ? + variable correction ..
		sumcol=0, sumrow=0;
		for (int j=0;j <len ;j++) {
			if (a[i][j] == -1) continue;			// INT_MAX or char '' or -1
			else {
				sumrow += a[i][j];
				sumcol += a[j][i];
			}
		}
		if (!sumrow || !sumcol) OWINS	//cout << "\n zero wins";
		if (sumrow==3 || sumcol==3) XWINS	//cout << "\n one wins";

		}	// for i()
		// row , clomuns done...
	
	int sumlead=0, sumnonlead=0, i=0;
	for (i=0; i< 3; i++) {
		sumlead += a[i][i];
		sumnonlead += a[i][2-i];
		}
	if ( sumlead ==0 || sumnonlead == 0 ) OWINS		//cout << "\n zero wins";
	else if (sumlead == 3 || sumnonlead==3 ) XWINS		//cout << "\n one wins";

	// deadlock, all ints filled ... but no one is blank
	int sum=0;
	for (i=0;i<len;i++)
		for (int j=0;j<len;j++)
				sum += a[i][j];

	if ( sum > 10 ) PLAYON
	else	DEAD

	// if any of the cell is empty ... then u shud continue to play
}
