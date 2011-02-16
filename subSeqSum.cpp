#include <iostream>
using namespace std;

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

int main () {
	int a[]= {4, -3, 5, -2 , -1, 2, 6,-4};

	int max = maxSum (a, 0, 7);
	printf ("\n max sume = [%d]", max);

return 0;
}
