import java.util.*;

public class longestPalin {
	private String input;

	longestPalin (String s) {
		input = s;
	}

	String longestPal () {
		int len = input.length();

		int ol,ou, el, eu;
		int p1, p2, ce, co, p3, p4;
		p1 =0; p2=0; p3 =0 ; p4 =0 ;

int maxo =0, maxe=0;
// odd case 
		for (int i =0;i<len ;i++) {
			// 2 pointers , considering odd / even length string
		ol = ou = i;
		co = -1;
		while (input.charAt(ol) == input.charAt(ou) ) {
			co++;
			ol--;ou++;
			if (ol < 0 || ou > (len-1) )
				break;
		}
		if (maxo < (2*co) ) {
			maxo = (2*co)+1;		// chars
			p1 = ++ol; p2 = --ou;
			}
	}	// for i

// even case
		for (int i =0; i< len ;i++) {
		if (i == len-1) break;

        el = i; eu = el+1;
        ce = 0;
        while (input.charAt(el) == input.charAt(eu) ) {
            ce++;
            el--; eu++;
            if (el < 0 || eu > (len-1) )
                break;
        }
		if (maxe < (2*ce) ) {
			maxe = (2*ce);
			p3 = ++el ; p4 =  --eu;
		}
		}	// for i

		System.out.println ( input.substring (p1, ++p2));
		System.out.println ( input.substring (p3, ++p4));

		//System.out.println ( "ol , ou, co " + ol + " " + ou + " " + co );
		//System.out.println ( "el , eu, ce " + el + " " + eu + " " + ce );


		return new String ("racedoom");
	}

	public static void main (String [] args) {
		longestPalin a = new longestPalin ("mississippi");
		//longestPalin a = new longestPalin ("racecar");
		//System.out.println ( " \n ===== " + new String ("racecar").substring(0,7));
		System.out.println (a.longestPal());
	}
}
