longestPalin.java

import java.util.*;

class longestPalin {
	private String input;

	longestPalin (String s) {
		input = s;
	}

	String longestPal () {
		int len = input.length();

		int ol,ou, el, eu;
		ol = ou = 0;
		eu = 1, el = 0;

		for (int i =0;i<len ;i++) {
			// 2 pointers , considering odd / even length string
			do {
				if (ol == 0) break;
				else if (ou == (len-1) break;
				
				ol--, ou++;
			} while (input.charAt(ol) == input.charAt(ou) );

		}
	}

	public static void main (String [] args) {

		String s = 
	}
}
