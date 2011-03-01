/*
DP knapscack 0-1 : its document @

https://docs.google.com/viewer?a=v&pid=explorer&chrome=true&srcid=1PLpeXuYgUQyxgmd_HPk4WTr_pJwtlSY6zwQp2swVf3cm3C4Rh30b-OsOVzdi&hl=en
*/

#include <iostream>
using namespace std;

int *ww, *v;
int len = 6;
int W=10;

int c[6][11];

void
func (/*int i, int w*/) {	// i th iteam ,and w intermediate weiginth
	int tmp=0;

	for (int i=1; i<=len ; i++)
		for (int w =1 ; w <= W; w++)
			{
				if (ww[i] <= w){
					tmp = v[i] + c[i-1][w-ww[i]];
					c[i][w] = (tmp > c[i-1][w]) ? tmp : c[i-1][w];
					tmp =0;
				}
				else 
				c[i][w] = c[i-1][w];
			}
}


void clean () {
	for (int i=0;i<6;i++)
		for (int j=0;j<(W+1);j++)
			c[i][j]= 0;
}

int main () {
	clean();
	int myw[] = {0, 4,2,3,1,6,4};
	int myv[] = {0, 6,4,5,3,9,7};
	ww = &myw[0], v = &myv[0];

	for (int i=0;i<(W+1);i++)
		c[0][i] = 0;
	for (int i =0; i<6; i++)
		c[i][0] = 0;
	
	func();
	cout << "\n" <<c[6][10];

	//func(6, 10);
}
