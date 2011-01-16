import java.util.*;

/* program to print infix to postfix
 * TODO:1. 	infix can contain ( or )	// done
 * 	2.	evaluate an infix expression using 2 stacks
 */
public class infixValue {

	public static int evaluate ( int right, int left, char c) {
		int res=0;
		switch (c) {
			case '/':
				res = right/left;
				break;
			case '*':
				res = right*left;
				break;
			case '+':
				res = right+left;
				break;
			case '-':
				res = right-left;
				break;
			default:
				System.out.println (" Wrong operators");
		}
	return res;
	}

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
		int base=10;
		HashMap precedence = new HashMap();
		populatemap(precedence);

		//System.out.println( precedence.get('/'));
		for (int i=0;i<s.length();i++) {
			char c = s.charAt(i);

			if (Character.isDigit(c)) {
				//soperand.push(c);
				Character.digit(c,base);
				postfix+=(c);
			}
			else {  // its an operator
				if (soperator.isEmpty() || c=='(')
					soperator.push (c);

				else if (c==')') {
					while ((soperator.peek()) != (Character)'(') {
						char op = (Character)soperator.pop();
						int right = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
						int left = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
						int eval = evaluate(right, left, op);
						soperand.push (eval);
					}
					postfix+=(soperator.pop());
					soperator.pop();	// pop the '('
				}

				else if ((Integer)precedence.get(soperator.peek()) < (Integer)precedence.get(c))
					soperator.push (c);

				else {
					int topofstack = (Integer)precedence.get(soperator.peek());
					int pointer = (Integer)precedence.get(c);
					System.out.println (" topofstck = "+topofstack + " pointer = " + pointer);

					while ( (Integer)precedence.get(soperator.peek()) > (Integer)precedence.get(c)) {
						char op = (Character)soperator.pop();
						int right = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
						int left = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
						int eval = evaluate(right, left, op);
						soperand.push (eval);
						postfix+=(op);
						if (soperator.isEmpty())
							break;
					}
					soperator.push(c);
				}
			}
			System.out.println ("i = "+ i + " char = "+c + " postfix = "+ postfix);
		}		// for()

		while (!soperator.isEmpty()) {
			char op = (Character)soperator.pop();
			int right = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
			int left = (Integer)soperand.pop();	//Character.digit((Character)soperand.pop(), base);
			int eval = evaluate(right, left, op);
			soperand.push (eval);
			postfix+=(op);
		}

		System.out.println (postfix);
		System.out.println ("final value = " + (soperand.pop()));
	}
}

