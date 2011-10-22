/*
# max contiguous sum

*/

#include <iostream>
#include <stdio.h>
using namespace std;

int maxSum (int a[], int i);

#if 0
// using diviede and conquer

int maxSum (int *a, int i, int j) {

	int max_sr, max_sl, sr, sl, sum_overlap, sum, mid, s1,s2;
	max_sr=max_sl=sr=sl=sum_overlap=sum=0;

// base condn.
	if (i>=j){
		if (a[i]<0) return 0;
		else return a[i];
	}

	mid = (i+j)/2;
	s1=maxSum (a, i, mid);	
	s2=maxSum (a, mid+1, j);	

	/*// find the overlapping sum */

	// move frm mid to i  backwards and find the max sum
		for (int p=mid; p>=i; p--){
			sl+=a[p];
			
			if (sl > max_sl) max_sl=sl;
	//		else break;
		}

        // move frm mid to j forwards and find the max sum
                for (int p=mid+1; p<=j; p++){
                        sr+=a[p];

                        if (sr> max_sr) max_sr=sr;
	//		else break;
                }

	sum_overlap = max_sl + max_sr;

	sum = (s1>s2)? s1:s2;
	sum = (sum_overlap>sum)? sum_overlap:sum;

	return sum;	
}
#endif

int main () {
	//int a[]= {-4, -3, -2, 4, 5, 6, -1, 2 };
	int a[]= {-4, -3, -2, 4, -5, -6, -1, 2 };
	//int a[]= {4, -3, 5, -2 , -1, 2, 6,-4};

	int max = maxSum (a, 8);
	//int max = maxSum (a, 0, 7);
	printf ("\n max sume = [%d]", max);

return 0;
}

/*

my code : O(n)

int maxsum ( int a[], int len) {
	int sufsum =0 , max = 0;

	for (i=0 to len-1)
	{ 
		sufsum = Max (0, a[i] + sufsum);
		max = Max (max, sufsum);
	}
}
*/

int maxSum (int a[], int length)
{
    int m = 0;
    int m_st=0, m_end=0;
    int msuf = 0;
    int msuf_st=0, msuf_end=0;
    // Invariant: m is the maximum subsequence sum for a[0..i-1],
    //            msuf is the maximum suffix sum for a[0..i-1]

    for (int i = 0; i < length; i++) {
      if (0 < msuf + a[i]) {
        msuf_end = i;
        msuf = msuf + a[i];
      }
      else {
        msuf = 0;
        msuf_st = i+1;  // anticipate that next will be +ve
        msuf_end = i+1;
      }
      //msuf = Math.max(0, msuf + a[i]);
      if (m < msuf) {
        m_st = msuf_st;
        m_end = msuf_end;
        m = msuf;
      }
      //m = Math.max(m, msuf);
    }
      printf ("\n pointers = %d || %d ", m_st, m_end);
      printf ("\n final = %d", m);

    return m;
  }
