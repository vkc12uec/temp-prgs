/*
DP knapscack 0-1 : its document @

https://docs.google.com/viewer?a=v&pid=explorer&chrome=true&srcid=1PLpeXuYgUQyxgmd_HPk4WTr_pJwtlSY6zwQp2swVf3cm3C4Rh30b-OsOVzdi&hl=en

2nd example from @ docs:
http://docs.google.com/viewer?a=v&q=cache:6_sAzUhiLvoJ:ace.cs.ohiou.edu/~razvan/courses/cs404/lecture16.pdf+0/1+knapsack&hl=en&gl=us&pid=bl&srcid=ADGEESi5xhpXfwhW2od1ynkf32bx0nEl9LXPwHB-g2h8pmkWFxuGVewUhBbeY7UZH0teymTIL0QKoCu3h0mvYEFIxwlZ86cQ-uKmlV9-xqNuIfrnhOvlxQW7qZS7RLdWpt6dU8dwn-Tk&sig=AHIEtbQkG5R1GMtap3GbnAMLODJjHLYt6g

Fractional knapsack:

	void (int W, int sroted[], int fractions[]) {
		for (int i=0; i<len ;i++) {
			if (W >= w[i]){
				fractions[i] = 1;
				W -= w[i];
			}
			else {
				fractions[i] = W/w[i];
				W = 0;
			}
		}
	}

*/

#include <iostream>
using namespace std;

int *ww, *v;

#define case1	1

#ifdef case1
int len = 6;
int W=10;
int c[6][11];
#endif

#ifdef case2
int len = 4;
int W=5;
int c[4][6];
#endif


void
func (/*int i, int w*/) {	// i th iteam ,and w intermediate weiginth
	int tmp=0;

	for (int i=1; i<=len ; i++)			// for iteams iter
		for (int w =1 ; w <= W; w++)	// for every possible weight
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
	for (int i=0;i<len;i++)
		for (int j=0;j<(W+1);j++)
			c[i][j]= 0;
}

int main () {
	clean();
#ifdef case2
	int myw[] = {0, 2, 3 ,4 ,5};
	int myv[] = {0, 3, 4, 5, 6};
#endif

#ifdef case1
	int myw[] = {0, 4,2,3,1,6,4};
	int myv[] = {0, 6,4,5,3,9,7};
#endif
	ww = &myw[0], v = &myv[0];

	for (int i=0;i<(W+1);i++)
		c[0][i] = 0;
	for (int i =0; i<len; i++)
		c[i][0] = 0;
	
	func();
#ifdef case2
	cout << "\n" <<c[4][5];
#endif

#ifdef case1
	cout << "\n" <<c[6][10];
#endif

	int k =10;
	for (int p=6; p>=0;p--)
	{
		if (c[p][k] != c[p-1][k])
			{
				cout << "\nitem "<< p  << " is in sack \n";
				k -= ww[p];
			}
	}

	//func(6, 10);
}
