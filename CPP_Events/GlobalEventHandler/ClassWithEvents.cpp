//By Slavko Novak november 2002

#include "ClassWithEvents.h"

ClassWithEvents::ClassWithEvents()
{
	this->iChange = 0L;
	this->i = 0;
}

ClassWithEvents::ClassWithEvents(void (*iChangeHandler)(int &))
{
	this->iChange = iChangeHandler;
	this->i = 0;
}

void ClassWithEvents::set_i(int iNum)
{
	this->i = iNum;
	
	if(this->iChange)
	{
		this->iChange(this->i);
	}
}

int ClassWithEvents::get_i(void)
{
	return this->i;
}
