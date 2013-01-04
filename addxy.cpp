#include <stdio.h>

/*code to add x, y w/o using + sign */


int addxy (int x, int y ) {
	printf ("\n adding x , y %d , %d", x, y);

	int cx, cy, bitsx, bitsy, ptrx, ptry;

	cx=x, cy=y, bitsx=0, bitsy=0, ptrx=1, ptry=1;

	while (cx) {
		//printf ("\ncx = %d", cx);
		cx=cx>>1;
		bitsx++;
	}

	while (cy) {
		///printf ("\ncx = %d", cx);
		cy=cy>>1;
		bitsy++;
	}

	printf ("\nbits x || y => bitsx %d || bitsy %d ", bitsx, bitsy);

	int result = 0, ptrresult = 1;

	int smallerbits = (bitsx > bitsy) ? bitsy : bitsx;
	int digx, digy, sum, carry, runningone=1;

	while (smallerbits) {
		int digx = x & runningone;
		int digy = y & runningone;

		sum = (digx ^ digy) ^ carry;
		carry = digx & digy;
		//ptrresult = ptrresult & sum;
		result |= (ptrresult & sum);

		printf ("\ndebug: digx || digy || sum || carry => %d , %d ,%d ,%d ", digx, digy, sum, carry);

		ptrresult = ptrresult<<1;
		runningone = runningone*2;
		//ptrx = ptrx<<1;
		//ptry = ptry<<1;

		smallerbits--;
	}

	if (carry == 1) {
		printf ("\nhere");
		result |= (ptrresult & carry);	
	}

	printf ("\nresult ==%d", result);

	//printf ("\nbits in cx=%d", bitsx);
	return 0;
}

int main () {
	int f = 5;
	int ptr=0;
	while ( f > (1<<ptr) ) {
		printf ("\n bit = %d", f&(1<<ptr));
		ptr++;
	}
	return 0;

	addxy (5,6);
	return 0;
}
