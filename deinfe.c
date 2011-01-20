#include <stdio.h>
#define PRFREE      '\002'      /* process slot is free     */
#define PRREADY     '\003'      /* process is on ready queue    */
#define PRRECV      '\011'      /* process waiting for message  */

int main (){

	int i = PRRECV;
	printf (" \nhello=[%d]", i);

return 0;
	
}
