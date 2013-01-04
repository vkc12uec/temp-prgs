import java.lang.Math;

public class KthlargestinSorted {
	public static int isPresent (int b[], int lo2, int high2, int k, int where) {
		// k is the no. to find.
		int lo = lo2, high = high2;	
		//int lo = 0, high = a.length;

		while (lo <= high) {

			int mid = (lo+high)/2;

			if (b[mid] == k){
				System.out.println ("no. found at index =" + mid);
				return mid;
			}
			else if (b[mid] < k) {
				if (mid != high && b[mid+1] > k ) {
					System.out.println ("possible index =" + mid+1);
					where = -1;
					return mid+1;
				}
				else if (mid == high)
					return high;
				else
					lo = mid+1;
			}
			else if (b[mid] > k ) {
				if (mid != lo && b[mid-1] < k) {
					System.out.println ("possible index =" + mid);
					where = 1;
					return mid;
				}
				else if (mid == lo)
					return mid;
				else 
					high = mid-1;
			}
		} // while
	}

	public static int getme(int[] a, int i, int j, int[] b, int k, int l){
		return l;

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a[] = {2,3,4,5};
		int b[] = {1,3,5,7,9};

		int k = 1, kth = 4, temp_len, where, mid1, index;
		int lo1= 0 , lo2 = 0, high1 = a.length, high2 = b.length;

		while (true) {
			mid1 = (lo1+high1)/2;
			index = isPresent (b, lo2, high2,  a[mid1], where);	// lo2 high2 shud vary

			switch (where) {
				case 0:
					temp_len = mid1 + index + 2; break;		// nx + ny
				case 1:
				case -1:
					temp_len = mid1 + index + 1; break;
			}

			System.out.println ("mid1 || index " + mid1 + " || " + index);

			if ( temp_len == kth && where == 0) {
				int max = Math.max (a[mid1], b[index]);
				System.out.println ("answer = " + max);
			}
			else if ( temp_len < kth ) {
				lo1 = mid1 + 1;
				lo2 = (where == 0) ? index+1 : index;
			}
			else if (temp_len > kth ) {
				high1 = mid1-1;
				high2 = index-1;
			}
		}	// while
	}


	//int kth = getme(a, 0, a.length, b, 0, b.length);

}
