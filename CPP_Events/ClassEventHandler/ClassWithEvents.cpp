//By Slavko Novak november 2002

#include "ClassWithEvents.h"


ClassWithEvents::ClassWithEvents()
{
	this->objClassWithEventsEvents = 0L;
	this->i = 0;
}

ClassWithEvents::ClassWithEvents(ClassWithEventsEvents *objClassWithEventsEventsHandler)
{
	this->objClassWithEventsEvents = objClassWithEventsEventsHandler;
	this->i = 0;
}

void ClassWithEvents::set_i(int iNum)
{
	this->i = iNum;

	if(objClassWithEventsEvents)
	{
		objClassWithEventsEvents->iChange(this->i);	
	}
}

int ClassWithEvents::get_i(void)
{
	return this->i;
}
