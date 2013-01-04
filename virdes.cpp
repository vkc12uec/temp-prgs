 #include <iostream>
 using namespace std;
 
class Base
{
       public:
          Base(){ cout<<"Constructor: Base"<<endl;}
          //~Base(){ cout<<"Destructor : Base"<<endl;}
          virtual ~Base(){ cout<<"Destructor : Base"<<endl;}
};
class Derived: public Base
{
     //Doing a lot of jobs by extending the functionality
       public:
           Derived(){ cout<<"Constructor: Derived"<<endl;}
           ~Derived(){ cout<<"Destructor : Derived"<<endl;}
 };
int  main()
{
#if 0
int x=2, y=4;
 x += 1;
 x = x++;
 x = y++;
 x = y = 5;
 x = ++y;

system ("pause");
return 0;
     char a[]="vivek";
     a[3]='g';
          cout<<a[3];
     a[3]='g';
     char *aa = "vivek";
     aa[3]='g';        //:"g";
     cout <<aa[3];
#endif
   
	Derived *d = new Derived();
	delete d;
#if 0 
        Base *Var = new Derived();
        delete Var;
		cout <<"\n";
		Base *b = new Base();
		delete b;
#endif
        return 0;
}

