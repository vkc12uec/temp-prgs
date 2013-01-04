//By Slavko Novak november 2002

#include <stdio.h>
#include "ClassWithEvents.h"

void myEvent(int &iNum)
{
	printf("Value of property 'i' = %d.\n", iNum);	
}

void main(void)
{
	ClassWithEvents objClassWithEvents(myEvent);

	objClassWithEvents.set_i(4);
}