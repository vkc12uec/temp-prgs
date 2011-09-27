
public class slidWindow {

	public static void slide (int []arr, int k) {

		int max, secmax, i, i1, i2;
		max = 0 ; secmax =0 ; i1 =0 ; i2 = 0;

		max = arr[0]; i1 = 0;

		for (i=1;i<k;i++) {
			if (arr[i] > max ) {
				secmax = max; 	i2 = i1;
				max = arr[i];	i1 = i;
			}
			else if (arr[i] > secmax) {
				secmax = arr[i];	i2 = i;
			}
		}

		debug ("max || i || secmax || j " + max + " " + i1 + " " + secmax + " " + i2);
		// max & secmax working fine ...

		// start slide from i=k to len-1
		int lostindex, temp;
		debug  ( "####" + k + " " + arr.length);
		for (i =k ; i< arr.length ; i++) {
			lostindex = i-k;
			temp = -1;

			debug ("new max || pointer " + max + " " + i1);

			if (i1 == lostindex) {
				// find the max from lostindex + 1 to i
				for (int j = lostindex+1; j<= i; j++) {
					if (arr[j] > temp) {
						temp = arr[j];	i1 = j;
					}
				}
				max = temp ; 	// i1 done
				}
			else {
					if (max < arr[i]){
						max = arr[i]; 	i1 = i;
					}
				}
			}	// for 
			debug ("new max || pointer " + max + " " + i1);

			//debug ("iteration || max || secmax " + i + " " + max + " " + secmax);
	}	// slide()

	public static void debug (String s) {
		System.out.println (s);
	}

	public static void main (String []args ) {
		int [] arr = {1,2 ,3 ,1, 4, 5, 2,3, 6}; 
		slide (arr, 5);
		//slide (arr, 4);
		//slide (arr, 3);
	}
}
