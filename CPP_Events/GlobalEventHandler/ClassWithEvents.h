//By Slavko Novak november 2002

#if !defined(_CLASS_WITH_EWENTS_)
#define _CLASS_WITH_EWENTS_


class ClassWithEvents
{
private:
	int i;
	void (*iChange)(int &);
public:
	ClassWithEvents();
	ClassWithEvents(void (*iChange)(int &));
	void set_i(int);
	int get_i(void);
};

#endif