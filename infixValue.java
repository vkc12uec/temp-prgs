import java.util.*;

/* program to print infix to postfix
 * TODO:1. 	infix can contain ( or )	// done
 * 	2.	evaluate an infix expression using 2 stacks
 */
public class infixValue {

    public static void populatemap ( HashMap h) {
        h.put('/', 2);
        h.put('*', 2);
        h.put('+', 1);
        h.put('-', 1);
        h.put('(', 0);
        h.put(')', 0);
    }

    public static void main(String[] args) {
        //System.out.println("Hello, World");
        //String s = "3+5*6-7*8+5";         // find its value	part1
        String s = "3+5*6-7*(8+5)";         // find its value	part2
        Stack soperand = new Stack ();
        Stack soperator = new Stack ();
        String postfix="";
        HashMap precedence = new HashMap();
        populatemap(precedence);

        //System.out.println( precedence.get('/'));
        for (int i=0;i<s.length();i++) {
                Character c = s.charAt(i);

            if (Character.isDigit(c)) {
                postfix+=(c);
            }
            else {  // its an operator
                if (soperator.isEmpty() || c=='(')
                    soperator.push (c);

		else if (c==')') {
			while ((soperator.peek()) != (Character)'(')
				postfix+=(soperator.pop());
			soperator.pop();
		}

		else if ((Integer)precedence.get(soperator.peek()) < (Integer)precedence.get(c))
                    soperator.push (c);

                else {
			int topofstack = (Integer)precedence.get(soperator.peek());
			int pointer = (Integer)precedence.get(c);
			System.out.println (" topofstck = "+topofstack + " pointer = " + pointer);
			while ( (Integer)precedence.get(soperator.peek()) > (Integer)precedence.get(c)) {
				postfix+=(soperator.pop());
				if (soperator.isEmpty())
					break;
			}
			soperator.push(c);
                }
            }
		System.out.println ("i = "+ i + " char = "+c + " postfix = "+ postfix);
        }		// for()

	while (!soperator.isEmpty())
		postfix+=(soperator.pop());

	System.out.println (postfix);
    }
}
