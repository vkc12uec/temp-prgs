/*
Code for a method that takes two arrays and returns true if one array is contained in the other..

1,2,3,4,5
2,3
true

1,2,3,4,5
2,4
false.

http://www.careercup.com/question?id=7744674
*/
public class  isContained {
	
	public static void iscon (int []a, int []b) {
	int flag =0;

	for (int i=0; i< a.length; i++) {
		System.out.println ( "testing a[] -> "+ a[i]);

		if (a[i] == b[0]) {
			int pb, pa;
			pb = 1; pa = (i+1);	//i++;
			//System.out.println (" *** pa || pb " + pa + "||" + pb + "||"+a[pa] + "|| " + b[pb]);

			while (a[pa] == b[pb]) {
				System.out.println ("in loop equals -> " + a[pa] + "||" + b[pb] );
				pa=pa+1;
				pb = pb+1;
				if ( pa == a.length || pb == b.length ) 
					break;
			}
			System.out.println ("After while:  pa || pb " + pa + "||" + pb);

			if (pb == b.length) 
				flag = 1;
			else if (pa == a.length && pb != b.length)
				System.out.println ("b len > a len");

			if (flag == 1) { System.out.println ("yes, contained"); }
			else { System.out.println ("No, not "); }
		}
	}	// for

	}		// iscon()

	public static void main (String []args) {

	int []a = {5, 6, 7, 8, 9, 0};
	int []b = {8, 9, 0 , 1};
	//int []b = {8, 9, 0 };
	//int []a = {1, 2, 3 ,4 ,5 };
	//int []b = {2, 3 , 4};

	iscon(a,b);

	}
}
