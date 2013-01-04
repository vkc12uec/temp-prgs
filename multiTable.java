/*
iprints multiplication table with space orientation b/w nos.

*/

public class multiTable {
	//print the multiplication table
	public static void printMultiTable(int n) {
		int[] startPositions = new int[n]; //start positions of the numbers in each row
		
		//compute startPositions according to the last row
		startPositions[0] = 0;
		for (int i=1;i<n;i++) {
			startPositions[i] = startPositions[i-1]+numOfDigit(n*i)+1; 
		}
		
		//print
		StringBuffer sb = new StringBuffer();
		for (int i=1;i<=n;i++) { //each row
			for (int k=1;k<=n;k++) { //each column
				int value = i*k; //the value to print
				sb.append(value);
				int numOfSpaces = 0;
				if (k<n) numOfSpaces = startPositions[k]-startPositions[k-1]-numOfDigit(value);
				for (int j=0;j<numOfSpaces;j++) {
					sb.append(' ');
				}
			}
			sb.append('\n');
		}
		System.out.print(sb.toString());
	}
	//compute the number of digit in n, in which n is larger than 0
	public static int numOfDigit(int n) {
		int count = 1;
		while (n > 0) {
			n = n / 10;
			count++;
		}
		return count;
	}
	public static void main(String[] args) {
		printMultiTable(1);
		printMultiTable(20);
	}
}



