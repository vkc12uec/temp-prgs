//By Slavko Novak november 2002

#include <stdio.h>
#include "ClassWithEvents.h"

class EventHandler : public ClassWithEventsEvents
{
private:
	void iChange(int &iNum)
	{
		printf("Value of property 'i' is = %d.\n", iNum);
	}

public:
	ClassWithEvents *objClassWithEvents;

	EventHandler()
	{
		objClassWithEvents = new ClassWithEvents(this);
	}

	~EventHandler()
	{
		delete objClassWithEvents;
	}

};

void main(void)
{
	EventHandler objEventHandler;
	
	objEventHandler.objClassWithEvents->set_i(4);
}