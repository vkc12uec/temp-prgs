//By Slavko Novak november 2002

#if !defined(_CLASS_WITH_EWENTS_)
#define _CLASS_WITH_EWENTS_

class ClassWithEventsEvents
{
public:
	virtual void iChange(int &) = 0;
};

class ClassWithEvents
{
private:
	int i;
	ClassWithEventsEvents *objClassWithEventsEvents;

public:
	ClassWithEvents();
	ClassWithEvents(ClassWithEventsEvents *);
	void set_i(int);
	int get_i(void);
};

#endif