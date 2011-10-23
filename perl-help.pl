intitle:"index.of" linkin (mp3|mp4|flv|avi|mpg|wmv) -html-htm-php-jsp-asp
http://www.ihas1337code.com/2010/04/hacking-google-interview-from-mit.html

###########################################
# barrier synchronization

method 1:

#################################################
#
# For N process to do a barrier syncro, use another new process_barr {} which will sync. these N process.


semaphore s [N] = {1};
semaphore all_arrived = 0;

process_i () {
	signal(s[i]);
	wait(all_arrived);
}

process_barrier () {
	for (int i =0;i<N;i++)
		wait(s[i]);
	for (int i =0;i<N;i++)
		signal[all_arrived];
}

# method 2:

1 rendezvous
2
3 mutex.wait()
4 count = count + 1
5 mutex.signal()
6
7 if count == n: barrier.signal()
8
9 barrier.wait()
10 barrier.signal()
11
12 critical point



###########################################
Although inline functions are similar to macros (because the function code is expanded at the point of the call at compile time), inline functions are parsed by the compiler, whereas macros are expanded by the preprocessor. As a result, there are several important differences:

Inline functions follow all the protocols of type safety enforced on normal functions.

Inline functions are specified using the same syntax as any other function except that they include the inline keyword in the function declaration.

Expressions passed as arguments to inline functions are evaluated once. In some cases, expressions passed as arguments to macros can be evaluated more than once

// inline_functions_macro.c
#include <stdio.h>
#include <conio.h>

#define toupper(a) ((a) >= 'a' && ((a) <= 'z') ? ((a)-('a'-'A')):(a))

int main() {
   char ch;
   printf_s("Enter a character: ");
   ch = toupper( getc(stdin) );
   printf_s( "%c", ch );
}



The intent of the expression toupper(getc(stdin)) is that a character should be read from the console device (stdin) and, if necessary, converted to uppercase.

Because of the implementation of the macro, getc is executed once to determine whether the character is greater than or equal to "a," and once to determine whether it is less than or equal to "z." If it is in that range, getc is executed again to convert the character to uppercase. This means the program waits for two or three characters when, ideally, it should wait for only one.

Inline functions remedy the problem previously described:


###########################################
#define my_sizeof(type) (char *)(&type+1)-(char*)(&type)
From anonymous is correct, however, i'd suggest the use of void pointers

'
###########################################
Simultaneous spinlocks
Now after you get into this stuff, you may find that you have to have more than one spinlock at a time. This
can lead to problems. Consider this:

Routine A:
lock spinlock X
maybe do some work
lock spinlock Y
do some more work
unlock spinlock Y
unlock spinlock X

And Routine B:
lock spinlock Y
maybe do some work
lock spinlock X
do some more work
unlock spinlock X
unlock spinlock Y

So CPU #1 comes along and starts routine A, while CPU #2 starts routine B. Well, they'll never finish,
because CPU #1 will be waiting for CPU #2 to release spinlock Y and CPU #2 will be waiting for CPU #1 to
release spinlock X.
So we have another simple rule: When locking more than one spinlock, they must always be locked in the
same order.
So for our example, both routines need to be changed so that they either both lock X then Y or they both lock
Y then X. You may be thinking, 'I might not be able to do that in ALL cases!' Easy to fix, replace the two
spinlocks with one, say Z.
Now I am terrible at checking to make sure I do everything in order. Computers are good at that sort of thing.
So rather than just using an 'int' for my spinlocks, I use a struct as follows:

typedef struct { char spinlock_flag; // the usual 0=unlocked, 1=locked
unsigned char spinlock_level; // 'locking' order
} Spinlock;

Then I have a spinlock_wait routine that checks to make sure my new spinlock's level is .gt. the last spinlock's
level that was locked by this cpu. If I try to do it out of order, the routine panics/BSOD's on the spot

'
###########################################
- ARP provides mapping
32bit IP address <-> 48bit MAC address
128.97.89.153  <-> 00-C0-4F-48-47-93
- ARP cache 
maintains the recent mappings from IP addresses to MAC addresses
Protocol
1. ARP request broadcast on Ethernet
2. Destination host ARP layer responds

IP: Internet Protocol
- Unreliable … connectionless datagram delivery service
- Responsible for routing of data through intermediate networks and computers

IP packet encapsulates the TCP/UDP packet.



###########################################

# default constructor is called if an array of objects is made
#
In C++, the standard describes the default constructor for a class as a constructor that can be called with no arguments (this includes a constructor whose parameters all have default arguments).[1]
In C++, default constructors are significant because they are automatically invoked in certain circumstances:
- When an object value is declared with no argument list, e.g. MyClass x;; or allocated dynamically with no argument list, e.g. new MyClass; the default constructor is used to initialize the object
- When an array of objects is declared, e.g. MyClass x[10];; or allocated dynamically, e.g. new MyClass [10]; the default constructor is used to initialize all the elements
- When a derived class constructor does not explicitly call the base class constructor in its initializer list, the default constructor for the base class is called
- When a class constructor does not explicitly call the constructor of one of its object-valued fields in its initializer list, the default constructor for the field's class is called
- In the standard library, certain containers "fill in" values using the default constructor when the value is not given explicitly, e.g. vector<MyClass>(10); initializes the vector with 10 elements, which are filled with the default-constructed value of our type.'
- In the above circumstances, it is an error if the class does not have a default constructor.''
The compiler will implicitly define a default constructor if no constructors are explicitly defined for a class. This implicitly-declared default constructor is equivalent to a default constructor defined with a blank body. (Note: if some constructors are defined, but they are all non-default, the compiler will not implicitly define a default constructor. This means that a default constructor may not exist for a class.)
'
'

# 5 types following ... u can init an array of objects

class MyClass {		# using set/get methods
  int x;
public:
  void setX(int i) { x = i; }
  int getX() { return x; }
};

int main()
{
  MyClass obs[4];
  int i;

  for(i=0; i < 4; i++)
    obs[i].setX(i);

--

class Fred {
 public:
   Fred();
   ...
 };

 int main()
 {
   Fred a[10];              ? calls the default constructor 10 times
   Fred* p = new Fred[10];  ? calls the default constructor 10 times
   ...
 }

 ---
class Fred {
 public:
   Fred(int i, int j);      ? assume there is no default constructor
   ...
 };

 int main()
 {
   Fred a[10];              ? ERROR: Fred doesn't have a default constructor
   Fred* p = new Fred[10];  ? ERROR: Fred doesn't have a default constructor
   ...
 }

---

#include <vector>

 int main()
 {
   std::vector<Fred> a(10, Fred(5,7));  ? the 10 Fred objects in std::vector a will be initialized with Fred(5,7)
   ...
 }

 ---
class Fred {
 public:
   Fred(int i, int j);      ? assume there is no default constructor
   ...
 };

 int main()
 {
   Fred a[10] = {
     Fred(5,7), Fred(5,7), Fred(5,7), Fred(5,7), Fred(5,7),  // The 10 Fred objects are
     Fred(5,7), Fred(5,7), Fred(5,7), Fred(5,7), Fred(5,7)   // initialized using Fred(5,7)
   };
   ...
 }




###########################################
IPv6 addresses are written in eight groups of four hexadecimal digits separated by colons, for example, 2001:0db8:85a3:0000:0000:8a2e:0370:7334
###########################################
Actually, the conversion rules are

a) Convert to the larger type.
b) In case of equal size prefer usigned over signed.

You can verify this by changing the declaration of int b to int64_t b. The output would now say Negative.


###########################################
http://rajeevprasanna.blogspot.com/search/label/Algos

###########################################
External libraries are usually provided in two forms: static libraries and shared libraries. Static libraries are the ‘.a’ files seen earlier. When a program is linked against a static library, the machine code from the object files for any external functions used by the program is copied from the library into the final executable.

Shared libraries are handled with a more advanced form of linking, which makes the executable file smaller. They use the extension ‘.so’, which stands for shared object.

# all theory of libs static | shared at @ http://www.network-theory.co.uk/docs/gccintro/gccintro_25.html
#
# Create a shared | static libs by @ http://www.adp-gmbh.ch/cpp/gcc/create_lib.html
#
###########################################
# Reading tcp/ip from : http://technet.microsoft.com/en-us/library/cc786900%28WS.10%29.aspx
#
# ARP: http://technet.microsoft.com/en-us/library/cc758357%28WS.10%29.aspx
To minimize the number of broadcasts, ARP maintains a cache of IP address-to-media access control address mappings for future use. The ARP cache can contain both dynamic and static entries. Dynamic entries are added and removed automatically over time. Static entries remain in the cache until the computer is restarted.

# ICMP:
 You can use the ping command to send ICMP echo request messages and record the receipt of ICMP echo reply messages. With these messages, you

#IGMP:
Other important aspects of IP multicasting include the following:

    Group membership is dynamic, allowing hosts to join and leave the group at any time.
    The ability of hosts to join multicast groups is performed through the sending of IGMP messages.
    Groups are not limited by size and members can be spread out across multiple IP networks (if connecting routers support the propagation of IP multicast traffic and group membership information).
    A host can send IP traffic to the group's IP address without belonging to the corresponding group
'
#UDP
UDP is fast, has low overhead requirements, and can support point-to-point and point-to-multipoint communication.

###########################################
to save a file as root which u are not permitted for vchaura
:w !sudo tee %
###########################################
<p>This is a slightly modified <tt class="xref py py-class docutils literal"><span class="pre">multiprocessing.Pool</span></tt>.

###########################################
http://anandtechblog.blogspot.com/2011/06/construct-given-tree-from-pre-order-and.html

dont know
###########################################
###########################################
http://www.mazeworks.com/mazegen/mazetut/index.htm
###########################################
Passing 2-dimensional arrays as parameters

C++ doesn't care about bounds, but it needs to compute the memory address given the subscripts (see below). To do this it needs to know the row width (number of columns). Therefore formal 2-dimensional array parameters must be declared with the row size, altho the number of rows may be omitted. For example,
void clearBoard(ticTacToeBoard[][3]) {
   . . .
}
'
###########################################
Creational Patterns - Factory Pattern

Factory of what? Of classes. In simple words, if we have a super class and n sub-classes, and based on data provided, we have to return the object of one of the sub-classes, we use a factory pattern.

?/// sub {}

When to use a Factory Pattern?
The Factory patterns can be used in following cases:
1. When a class does not know which class of objects it must create.
2. A class specifies its sub-classes to specify which objects to create.
3. In programmer’s language (very raw form), you can use factory pattern where you have to create an object of any one of sub-classes depending on the data provided


###########################################
Gola: suppose you can take a max. of N turns to find the floor
Now you will throw the first egg from the Nth floor
if it breaks, you will start from floor no. 1 (ground floor) .. and go up to (N-1)th floor testing the egg
this will take max. N turns
If the first egg doest not break from the Nth floor, you will throw it again from N + (N-1) = (2N-1)th floor
This is because in doing so, you are using 2 turns already, leaving behind N-2 more throws, which is fine .. as you will have to test from floor no. N+1 to floor no. 2N-2 .. thus taking N-2 turns
in this way you will throw the first egg from N, N+(N-1), N+(N-1)+(N-2) .. and so on ..
Now the total floors to be tested is 100
Now the total floors to be tested is 100
so N + (N-1) + (N-2) ... has to be greater than 100
so the minimum such N is the answer

###########################################
###########################################
Bucket Sort:
	N nos., each M bit:		O(N)
	http://www.personal.kent.edu/~rmuhamma/Algorithms/MyAlgorithms/Sorting/bucketSort.htm

Radix sort:
	O(M*N)
	M is for outer loop.
	Each internal loop is for N times, using bucket sort

Count sort:
	O(N)
	http://www.personal.kent.edu/~rmuhamma/Algorithms/MyAlgorithms/Sorting/countingSort.htm
###########################################
babylonian method:

This is a quadratically convergent algorithm, which means that the number of correct digits of the approximation roughly doubles with each iteration. It proceeds as follows:
Begin with an arbitrary positive starting value x0 (the closer to the root, the better).
Let xn+1 be the average of xn and S / xn (using the arithmetic mean to approximate the geometric mean).
Repeat step 2 until the desired accuracy is achieved.

###########################################
    abstract class GraphicObject {
        int x, y;
        ...
        void moveTo(int newX, int newY) {
            ...
        }
        abstract void draw();
        abstract void resize();
    }

Each non-abstract subclass of GraphicObject, such as Circle and Rectangle, must provide implementations for the draw and resize methods:

    class Circle extends GraphicObject {
        void draw() {
            ...
        }
        void resize() {
            ...
        }
    }
    class Rectangle extends GraphicObject {
        void draw() {
            ...
        }
        void resize() {
            ...
        }
    }

###########################################
sudo apt-get update
	To install all available updates:
sudo apt-get upgrade
	To search for a package:
apt-cache search package
	To install a package:
sudo apt-get install package
	To remove a package:
sudo apt-get remove package
	To list other apt commands and options:
apt-get help

###########################################
A two's-complement system or two's-complement arithmetic is a system in which negative numbers are represented by the two's complement of the absolute value;[1] this system is the most common method of representing signed integers on computers.[2] In such a system, a number is negated (converted from positive to negative or vice versa) by computing its two's complement.

An N-bit two's-complement numeral system can represent every integer in the range : -2^(N-1) to +2^(N-1) -1

For example, a signed 16 bit integer could hold (Approximately) the values -32768 to 32767, while an unsigned 16 bit integer could hold the values 0 to 65535.

'
###########################################
5.1. (DCE, POSIX, UI) Async safety (Programming threads)

Some library routines can be safely called from within signal
handlers; these are referred to as async-safe. A thread that is
executing some async-safe code will not deadlock if it is interrupted
by a signal. If you want to make some of your own code async-safe, you
should block signals before you obtain any locks.

###########################################
ls | wc
I'm going to make another note about the close()/dup() combination since it's pretty weird.
close(1) frees up file descriptor 1 (standard output). dup(pfds[1]) makes a copy of the write-end of
the pipe in the first available file descriptor, which is “1”, since we just closed that. In this way, anything
that ls writes to standard output (file descriptor 1) will instead go to pfds[1] (the write end of the pipe).
The wc section of code works the same way, except in revers

###########################################
Unions like structure contain members whose individual data types may differ from one another. However the members that compose a union all share the same storage area within the computers memory where as each member within a structure is assigned its own unique storage area. Thus unions are used to conserve memory. They are useful for application involving multiple members. Where values need not be assigned to all the members at any one time. Like structures union can be declared using the keyword union as follows:

union {
float coords[3];
char about[20];
} assocdata;

code.m=456;
code.p=456.78;
printf(“%d”,code.m);

Would produce erroneous result.

In effect a union creates a storage location that can be used by one of its members at a time. When a different number is assigned a new value the new value supercedes the previous members value. Unions may be used in all places where a structure is allowed. The notation for accessing a union member that is nested inside a structure remains the same as for the nested structure.



http://developers.facebook.com/docs/guides/web
###########################################
###########################################
###########################################
Some examples of sorts which are not comparison sorts include:

    * Radix sort (examines individual bits of keys)
    * Counting sort (indexes using key values)
    * Bucket sort (examines bits of keys)

###########################################
http://www.cplusplus.com/doc/tutorial/typecasting/
###########################################
http://code.google.com/p/memcached/wiki/NewUserInternals
http://www.usenix.org/event/usenix99/full_papers/pai/pai_html/node8.html
###########################################
infix to postfix:

http://scriptasylum.com/tutorials/infix_postfix/algorithms/infix-postfix/index.htm
http://www.coders2020.com/what-is-infix-prefix-postfix-how-can-you-convert-from-one-representation-to-another-how-do-you-evaluate-these-expressions
/

# coders link has to verify if online conversion is going well.

<<<<<<<<<<<<<<

Is there a way to find out if the converted postfix expression is valid or not
Yes. We need to associate a rank for each symbol of the expression. The rank of an operator is -1 and the rank of an operand is +1. The total rank of an expression can be determined as follows:
- If an operand is placed in the post fix expression, increment the rank by 1.
- If an operator is placed in the post fix expression, decrement the rank by 1.
At any point of time, while converting an infix expression to a postfix expression, the rank of the expression can be greater than or equal to one.
#If the rank is anytime less than one, the expression is invalid. #
Once the entire expression is converted, the rank must be equal to 1. Else the expression is invalid.

>>>>>>>>>>>>>>

Infix to Postfix Conversion :

In normal algebra we use the infix notation like a+b*c. The corresponding postfix notation is abc*+. The algorithm for the conversion is as follows :

    * Scan the Infix string from left to right.
    * Initialise an empty stack.
    * If the scannned character is an operand, add it to the Postfix string. If the scanned character is an operator and if the stack is empty Push the character to stack.
          o If the scanned character is an Operand and the stack is not empty, compare the precedence of the character with the element on top of the stack (topStack). If topStack has higher precedence over the scanned character Pop the stack else Push the scanned character to stack. Repeat this step as long as stack is not empty and topStack has precedence over the character.
      Repeat this step till all the characters are scanned.
    * (After all characters are scanned, we have to add any character that the stack may have to the Postfix string.) If stack is not empty add topStack to Postfix string and Pop the stack. Repeat this step as long as stack is not empty.
    * Return the Postfix string.

Conversion from infix to prefix:

This is very similar to the method mentioned above, except the fact that we add the special value [ at the start of the expression and ] to the stack and we move through the infix expression from right to left. Also at the end, reverse the output expression got to get the prefix expression.


###########################################
An object of the class that contains one or more virtual functions contains a virtual pointer called the vptr at the very beginning of the object in the memory. Hence the size of the object in this case increases by the size of the pointer. This vptr contains the base address of the virtual table in memory. Note that virtual tables are class specific, i.e., there is only one virtual table for a class irrespective of the number of virtual functions it contains. This virtual table in turn contains the base addresses of one or more virtual functions of the class. At the time when a virtual function is called on an object, the vptr of that object provides the base address of the virtual table for that class in memory. This table is used to resolve the function call as it contains the addresses of all the virtual functions of that class. This is how dynamic binding is resolved during a virtual function call.

How virtual functions are implemented C++?

Virtual functions are implemented using a table of function pointers, called the vtable.  There is one entry in the table per virtual function in the class.  This table is created by the constructor of the class.  When a derived class is constructed, its base class is constructed first which creates the vtable.  If the derived class overrides any of the base classes virtual functions, those entries in the vtable are overwritten by the derived class constructor.  This is why you should never call virtual functions from a constructor: because the vtable entries for the object may not have been set up by the derived class constructor yet, so you might end up calling base class implementations of those virtual functions

slide 38 : vtable-Polymorphism_Part1_Print.pdf

###########################################
0/1 knapsack is NP hard
TSP	NP - complete
###########################################
The C++ rule is that you must never throw an exception from a destructor that is being called during the "stack unwinding" process of another exception. For example, if someone says throw Foo(), the stack will be unwound so all the stack frames between the throw Foo() and the } catch (Foo e) { will get popped. This is called stack unwinding.

During stack unwinding, all the local objects in all those stack frames are destructed. If one of those destructors throws an exception (say it throws a Bar object), the C++ runtime system is in a no-win situation: should it ignore the Bar and end up in the } catch (Foo e) { where it was originally headed? Should it ignore the Foo and look for a } catch (Bar e) { handler? There is no good answer ¿ either choice loses information.

So the C++ language guarantees that it will call terminate() at this point, and terminate() kills the process. Bang you're dead.
'
# Stack unwinding example
http://publib.boulder.ibm.com/infocenter/comphelp/v8v101/index.jsp?topic=%2Fcom.ibm.xlcpp8a.doc%2Flanguage%2Fref%2Fcplr155.htm

###########################################
[bloomberg]. .... initialization lists is constructors ... :

if base class has a class object of type Class1, then u use initialization lists to pass constructor values to baseclass ojbect.

http://www.cprogramming.com/tutorial/initialization-lists-c++.html
http://www.parashift.com/c++-faq-lite/ctors.html#faq-10.6

# if you use const data member, then use initialization list to assign values
1	class Something
2	{
3	private:
4	    const int m_nValue;
5	public:
6	    Something(): m_nValue(5)
7	    {
8	    }
9	};

Consider the following constructor that initializes member object x_ using an initialization list: Fred::Fred() : x_(whatever) { }. The most common benefit of doing this is improved performance. For example, if the expression whatever is the same type as member variable x_, the result of the whatever expression is constructed directly inside x_ — the compiler does not make a separate copy of the object. Even if the types are not the same, the compiler is usually able to do a better job with initialization lists than with assignments.

The other (inefficient) way to build constructors is via assignment, such as: Fred::Fred() { x_ = whatever; }. In this case the expression whatever causes a separate, temporary object to be created, and this temporary object is passed into the x_ object's assignment operator. Then that temporary object is destructed at the ;. That's inefficient.

# why is named cstor needed

 class Point {
 public:
   Point(float x, float y);     // Rectangular coordinates
   Point(float r, float a);     // Polar coordinates (radius and angle)
   // ERROR: Overload is Ambiguous: Point::Point(float,float)
 };

 int main()
 {
   Point p = Point(5.7, 1.2);   // Ambiguous: Which coordinate system?
   ...
 }
One way to solve this ambiguity is to use the Named Constructor Idiom:

 #include <cmath>               // To get std::sin() and std::cos()

 class Point {
 public:
   static Point rectangular(float x, float y);      // Rectangular coord's
   static Point polar(float radius, float angle);   // Polar coordinates
   // These static methods are the so-called "named constructors"
   ...

'


###########################################
qsrot.h @ sahni codes:
	E:\My eBooks\Algo\Sahni Codes\all
###########################################


###########################################
#

###########################################
static variables are stored in the data segment or BSS of the process memory.

xinu: un-initialised data in BSS

###########################################
in STL, map is implemented by RB tree, while hashmap is implemented via hash

In STL, map is implemented by RB Tree whereas Hashmap is implemented by linkedlists/vectors
Map does have duplicates. HashMap has.
Map does not have collisions.
Map has a complexity O(logn), hashmaps generally have O(1).


###########################################
const int x;      // constant int
x = 2;            // illegal - can't modify x

const int* pX;    // changeable pointer to constant int
*pX = 3;          // illegal -  can't use pX to modify an int
pX = &someOtherIntVar;      // legal - pX can point somewhere else

int* const pY;              // constant pointer to changeable int
*pY = 4;                    // legal - can use pY to modify an int
pY = &someOtherIntVar;      // illegal - can't make pY point anywhere else

const int* const pZ;        // const pointer to const int
*pZ = 5;                    // illegal - can't use pZ to modify an int
pZ = &someOtherIntVar;      // illegal - can't make pZ point anywhere else

'
###########################################
#http://www.cplusplus.com/doc/tutorial/exceptions/

float myfunction (char param) throw (int);


This declares a function called myfunction which takes one agument of type char and returns an element of type float. The only exception that this function might throw is an exception of type int. If it throws an exception with a different type, either directly or indirectly, it cannot be caught by a regular int-type handler.


int myfunction (int param) throw(); // no exceptions allowed
int myfunction (int param);         // all exceptions allowed


'
###########################################
what are allocators ?

STL provides several data structures/containers. These containers require ability to change size during runtime. Allocators handle all the requests for allocation and deallocation of memory for a given container (dynamic memory allocation)
'
###########################################
Notice how we appended =0 to virtual int area () instead of specifying an implementation for the function. This type of function is called a pure virtual function, and all classes that contain at least one pure virtual function are abstract base classes.

The main difference between an abstract base class and a regular polymorphic class is that because in abstract base classes at least one of its members lacks implementation we cannot create instances (objects) of it.

But a class that cannot instantiate objects is not totally useless. We can create pointers to it and take advantage of all its polymorphic abilities. Therefore a declaration like:

CPolygon poly;

would not be valid for the abstract base class we have just declared, because tries to instantiate an object. Nevertheless, the following pointers:

CPolygon * ppoly1;
CPolygon * ppoly2;

would be perfectly valid.

###########################################
###########################################
16.21] How can I force objects of my class to always be created via new rather than as locals or global/static objects?

http://www.parashift.com/c++-faq-lite/freestore-mgmt.html#faq-16.21

Use the Named Constructor Idiom.

As usual with the Named Constructor Idiom, the constructors are all private or protected, and there are one or more public static create() methods (the so-called "named constructors"), one per constructor. In this case the create() methods allocate the objects via new. Since the constructors themselves are not public, there is no other way to create objects of the class.

#Make sure your constructors are in the protected section if you expect Fred to have derived classes.

Note also that you can make another class Wilma a friend of Fred if you want to allow a Wilma to have a member object of class Fred, but of course this is a softening of the original goal, namely to force Fred objects to be allocated via new.

		 class Fred {
		 public:
		   // The create() methods are the "named constructors":
		   static Fred* create()                 { return new Fred();     }
		   static Fred* create(int i)            { return new Fred(i);    }
		   static Fred* create(Fred const& fred) { return new Fred(fred); }
		   ...

		 private:
		   // The constructors themselves are private or protected:
		   Fred();
		   Fred(int i);
		   Fred(Fred const& fred);
		   ...
		 };

		int main()
		 {
		   Fred* p = Fred::create(5);
		   ...
		   delete p;
		   ...
		 }

for e.g.: // vkc

class x {
	public:
	static x* (int a) { return new x(a); }		// we make static so that it can be called by
							// class name

	private:
	int datamem;
	x(int a) { datamem=a;}
};

###########################################
Is there any other way of declaring const variables ?

Yes, by using enum

###########################################
# to call a C function frm within a c++ program
#http://www.parashift.com/c++-faq-lite/mixing-c-and-cpp.html#faq-32.6
#
extern "C" void f(int i, char c, float x);
###########################################
Suppose, I write

class A { };

compiler should provide (as and when needed)

       1. a constructor
       2. a destructor
       3. a copy constructor
       4. = operator

#
###########################################
n gas stations iwth each capacity c[i] ..... in circle ? which station u choose. ..

based on sub sequence problem ....
###########################################
/* va_arg example */
#include <stdio.h>
#include <stdarg.h>

int FindMax ( int amount, ...)
{
  int i,val,greater;
  va_list vl;
  va_start(vl,amount);
  greater=va_arg(vl,int);
  for (i=1;i<amount;i++)
  {
    val=va_arg(vl,int);
    greater=(greater>val)?greater:val;
  }
  va_end(vl);
  return greater;
}

int main ()
{
  int m;
  m= FindMax (7,702,422,631,834,892,104,772);
  printf ("The greatest one is: %d\n",m);
  return 0;
}


###########################################
java v/s C++

1) Bytecode vs Object Code
2) No Multiple Inheritence through base classes vs Multiple Inheritence
3) Automatic garbage collection vs No Automatic Garbage Collection.
4) No Destructor vs destructors

###########################################
int findRatio(double val, double tolerance, int &numerator, int &denominator)
http://www.careercup.com/question?id=133804

###########################################
###########################################
Q4) Explain stack unwinding.

A4) Stack unwinding occurs when an exception is thrown and control passes from a try block to a handler. Automatic objects are destroyed in the reverse order of their construction. If a destructor throws an exception during the stack unwinding process, terminate is called.


###########################################
How are prefix and postfix versions of operator++() differentiated?

The postfix version of operator++() has a dummy parameter of type int. The prefix version does not have dummy parameter.


###########################################
"delete" first calls the object"s termination routine (i.e. its destructor) and then releases the space the object occupied on the heap memory. If an array of objects was created using new, then delete must be told that it is dealing with an array by preceding the name with an empty []:-


http://www.shettysoft.com/interview/C_C++_interview_questions_answers.htm

###########################################
mutable keyword indicates that particular member of a structure or class can be altered even if a particular structure variable, class, or class member function is constant.

struct data
{
char name[80];
mutable double salary;
}

const data MyStruct = { "Satish Shetty", 1000 }; //initlized by complier

strcpy ( MyStruct.name, "Shilpa Shetty"); // compiler error
MyStruct.salaray = 2000 ; // complier is happy allowed

###########################################
###########################################
###########################################
strange constructor evaluations:

What is conversion constructor?

constructor with a single argument makes that constructor as conversion ctor and it can be used for type conversion.

#include <iostream>
using namespace std;
class Boo
{
    int x;
  public:
    Boo( int i ){
        x=i;
    }
    void prnt(){    cout << x; }
};

int main () {
Boo BooObject = 10 ; // assigning int 10 Boo object
BooObject.prnt();
return 0;
}



###########################################
http://graphics.stanford.edu/~seander/bithacks.html#DetermineIfPowerOf2
###########################################
select kth largest number:

http://en.wikipedia.org/wiki/Selection_algorithm


compile time polymorphism (templates) and run-time polymorphism using dynamic binding.
###########################################

bipartite: http://en.wikipedia.org/wiki/Bipartite_graph

Any graph with no odd cycles is bipartite. As a consequence of this:

    * Every tree is bipartite.
    * Cycle graphs with an even number of vertices are bipartite.


http://en.wikipedia.org/wiki/Shortest_path

The travelling salesman problem is the problem of finding the shortest path that goes through every vertex exactly once, and returns to the start. Unlike the shortest path problem, which can be solved in polynomial time in graphs without negative cycles (edges with negative weights), the travelling salesman problem is NP-complete and, as such, is believed not to be efficiently solvable (see P = NP problem). The problem of finding the longest path in a graph is also NP-complete.
###########################################
http://geek-o-pedia.blogspot.com/2008/03/recently-i-encountered-trivial-but.html
2 queues into a stack:

    * Version A: The stack should be efficient when pushing an item.
    * Version B: The stack should be efficient when popping an item.


Version A:

    * push:
          o enqueue in queue1	: 1,2,3,4,5
    * pop:
          o while size of queue1 is bigger than 1, pipe dequeued items from queue1 into queue2	{1,2,3,4} last = {5}
          o dequeue and return the last item of queue1, then switch the names of queue1 and queue2
	  	return 5 as pop and queue2 is now queue1

Version B:

    * push:
          o enqueue in queue2 	: 1,2,3,4,5
          o enqueue all items of queue1 in queue2, then switch the names of queue1 and queue2
	  		q1 = 1,2,3,4,5
			q2 = {}
    * pop:
          o deqeue from queue1




http://www.nas-san.com/differ.html		[nas v/s san]
###########################################
Snapshot is point in time image of any individual file/directory or entire File System, this is normally done when we need to create point in time backup with almost 0 downtime of production server to take backup, during the snapshot all the disk I/O are cached and a block by block image is created of entire FS, before doing this a mapping/header of FS is created which gives the information about the which file lies in which block for the purpose of retrieval now this header and the image is copied to tape as backup

###########################################
todo:
	operator overloading in classes
	the way done in sartaj sahni for outputtting..

	template<class T>
	void LinearList<T>::Output(ostream& out) const
	{// Put the list into the stream out.
	   for (int i = 0; i < length; i++)
	      out << element[i] << "  ";
	}

	// overload <<
	template <class T>
	ostream& operator<<(ostream& out, const LinearList<T>& x)
	   {x.Output(out); return out;}

################################################

Or it can be done by directly using a friend function...

friend ostream &operator<<(ostream &out, Complex c)     //output
{
        out<<"real part: "<<<"\n";
        out<<"imag part: "<<<"\n";
        return out;
}
friend istream &operator>>(istream &in, Complex &c)     //input
{
        cout<<"enter real part:\n";
        in>>c.real;
        cout<<"enter imag part: \n";
        in>>c.imag;
        return in;
}

###########################################

	http://en.wikipedia.org/wiki/Adjacency_matrix

	If A is the adjacency matrix of the directed or undirected graph G, then the matrix An (i.e., the matrix product of n copies of A) has an interesting interpretation: the entry in row i and column j gives the number of (directed or undirected) walks of length n from vertex i to vertex j. This implies, for example, that the number of triangles in an undirected graph G is exactly the trace of A3 divided by 6.



###########################################
    rat in a maze:	queue will give the shortest path
###########################################
###########################################
Using a soft link is easy. A and B both have their own inodes and both are part of different directories.
However, A actually contains the full path and name of B. When your system tries to access A, it will see the reference to B (via the full path), locate B by following the path and then access it. Since the full filesystem path is used, soft links work accross different partitions. If A is indeed a soft link to B on a different partition and B's partition is unmounted, then the link will continue to exist but will simply point to something unreachable. So you can't access A either. Same goes when B gets deleted. If A (the soft link) would be deleted, then B is still there, unaltered.

Hard links are a different story. As I explained, the contents of a directory are nothing more than pairs of inode numbers and names. The inodes are used to access the actual items in the directory. The names are just there for the ease-of-use, more or less. A hard link is nothing more than copying the inode number from one entry in some directory's contents into another entry. This second entry can be in a different directory's contents or even in the same directory (under a different name).
Since both directory entries have the same inode number, they point to the same item on the disk (ie the same physical file). Of course, inode numbers, as explained above, are partition-specific. So, duplicating an inode number on a different partition would not work as expected. That's why hard links cannot work across partitions.

###########################################
sub path {
    my $self = shift;
    print "* path(", join(',', @_),")\n" if $debug>1;

    my $pt = shift;
    my $rp = shift;

    die "Path type not specified\n" if !defined($pt);
    die "Invalid path type\n" if $pt eq "";
    die "Invalid path type\n" if !exists($valid_pt{$pt});
    my $root = $self->{roots}->{$valid_pt{$pt}};
    $root =~ s|/\Z||o; # strip trailing slash, if any
    do {
	print "* path => $root\n" if $debug>1;
	return $root;
    } if !defined($rp);

    die "Relative path not specified\n" if $rp =~ m|\A/|o;
    my $p = join('/', $root, $rp);
    print "* path => $p\n" if $debug>1;
    return $p;
}

###########################################
netstat -nap

###########################################
loader/linker
http://www.faqs.org/docs/Linux-HOWTO/Program-Library-HOWTO.html
http://www.linuxjournal.com/article/6463
###########################################
#define errorf(format, ...) fprintf(stderr, "%s[%d] %s() ERROR: " format "\n", __FILE__, __LINE__, __func__, ##__VA_ARGS__)

###########################################
http://gcc.gnu.org/onlinedocs/cpp/Search-Path.html#Search-Path
http://www.network-theory.co.uk/docs/gccintro/gccintro_22.html
###########################################
This system call returns a new socket descriptor.  In a concurrent server, after accept and fork, the child process closes the original socket descriptor and uses the new socket descriptor so that the parent process can accept more connections using the original socket descriptor.

http://www.cas.mcmaster.ca/~qiao/courses/cs3mh3/tutorials/socket.html

	order of calls:
		- socket -> bind -> listen -> accept
###########################################
actual upload.cgi file:

#!/usr/bin/perl -w

use CGI;
$upload_dir = "/apache2-default/projects/music/upload";

$query = new CGI;

$filename = $query->param("song");
$filename =~ s/.*[\/\\](.*)/$1/;		# EXTRACT JUST THE LAST NAME
						# $filename = "c:/hel/one/two/three";
						# $1 = three
$upload_filehandle = $query->upload("song");

open(UPLOADFILE, ">$upload_dir/$filename") or die "Can't open '$upload_dir/$filename': $!";
binmode UPLOADFILE;
while ( <$upload_filehandle> )
{
print UPLOADFILE;
}
close UPLOADFILE;

###########################################
###########################################
Enum example in C

#include <stdio.h>
int main()
{
enum Days{Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday};

Days TheDay;
int j = 0;
printf("Please enter the day of the week (0 to 6)\n");
scanf("%d",&j);
TheDay = Days(j);

if(TheDay == Sunday || TheDay == Saturday)
printf("Hurray it is the weekend\n");
else
printf("Curses still at work\n");

return 0;
}

###########################################
http://linux-mm.org/PageTableStructure
###########################################
http://lwn.net/Kernel/LDD3/
###########################################
perl udp server:

use IO::Socket;
$server = IO::Socket::INET->new(LocalPort => $server_port, Proto=>"udp") or
	die "Couldn't be a udp server on port $server_port : $@\n";

while ($him = $server->recv($datagram, $MAX_TO_READ, $flags)) {
   	# do something
}

udpqotd - UDP message server

use strict;
use IO::Socket;

my($sock, $oldmsg, $newmsg, $hisaddr, $hishost, $MAXLEN, $PORTNO);
$MAXLEN = 1024; $PORTNO = 5151;

$sock = IO::Socket::INET->new(LocalPort => $PORTNO, Proto => 'udp')
	or die "socket: $@"; print "Awaiting UDP messages on port $PORTNO\n";

$oldmsg = "This is the starting message.";

while ($sock->recv($newmsg, $MAXLEN)) {
	my($port, $ipaddr) = sockaddr_in($sock->peername);
	$hishost = gethostbyaddr($ipaddr, AF_INET);
	print "Client $hishost said ``$newmsg''\n";
	$sock->send($oldmsg);
	$oldmsg = "[$hishost] $newmsg";
}  die "recv: $!";

"
'
?
#//
###########################################
###########################################
stack frame / function call method:

http://abrickshort.files.wordpress.com/2006/11/stackframe.jpg
http://abrickshort.wordpress.com/2005/04/10/how-function-calls-work/

How recursive functions work?
The recursive functions work in same way as the other functions. For every recursive call a new stack frame of the function is created. But this avoided in tail recursive calls in functional languages. In tail recursive call, each recursive call is made to loop to the same stack frame.

###########################################
http://c2.com/cgi/wiki?TailRecursion
###########################################
A few more caveats:	vim tricks

    * You can jump directly to a tag by typing ":t symbol" in command mode.
    * When you jump to a tag, vim will sometimes tell you "tag 1 of 4 or more" (or something like that). In this case, typing ":tn" (n is for next) or ":tp" (previous) will move you along.

###########################################
###########################################
Templates with Classes:		e.g. maxheap.h from Srtaj Sahni

run => gvim "E:\My eBooks\Algo\Sahni Codes\all\maxheap.h"
###########################################

# BETTER WRITE A PROGRAM SAME LIKE HEAP.H #	do it now

# NOTE #	http://www.fredosaurus.com/notes-cpp/oop-memberfuncs/constmemberfuncs.html
# coder declares Output() as const member function becoz, generally, such functions dont have to modify any data

# A function can only be declared const if it doesn't modify any of its fields.
##	const can't be used for constructors and destructors
The purpose of a constructor is to initialize field values, so it must change the object. Similarly for destructors.

##	Can overload with non-const functions
There can be both const and non-const functions. The compiler will choose the appropriate one to call depending on the object they are being applied to. [Note: this seems like more of a theoretical possibility rather than something that would ever be used. Is there a common use for defining more than the const version?]

## msdn
Declaring a member function with the const keyword specifies that the function is a "read-only" function that does not modify the object for which it is called. A constant member function cannot modify any non-static data members or call any member functions that aren't constant.'

<IMPORTANT syntax>
To declare a constant member function, place the const keyword after the closing parenthesis of the argument list. The const keyword is required in both the declaration and the definition.

#######################################################################################
#<code>// C2662.cpp
class C {
public:
   void func1();
   void func2() const{}
} const c;

int main() {
   c.func1();   // C2662	ERROR
   c.func2();   // OK
}

if time : read : http://www.cprogramming.com/tutorial/const_correctness.html

# Mutatble
# C++ Support for Conceptual Constness
C++ provides for conceptual constness by using the mutable keyword: when declaring a class, you may specify that some of the fields are mutable:

mutable int my_cached_result;

this will allow const functions to change the field regardless of whether or not the object itself was declared as const

#######################################################################################
# Merging 2 heaps ??
	# Merging heap is good with Binomial heaps. [read it]
# TODO: Quick sort tail recursion
# mergesort linked list ?
# Write a program for 2-4 cormen, count no. of inversions in an arr using merge sort.
# Ranking nodes in BST can help us in finding no. of inversions
#############################


template<class T>
class MaxHeap {
   public:
      MaxHeap(int MaxHeapSize = 10);
      ~MaxHeap() {delete [] heap;}
      int Size() const {return CurrentSize;}
      T Max() {if (CurrentSize == 0)
                  throw OutOfBounds();
               return heap[1];}
      MaxHeap<T>& Insert(const T& x);
      MaxHeap<T>& DeleteMax(T& x);
      void Initialize(T a[], int size, int ArraySize);
      void Deactivate() {heap = 0;}
      void Output() const;
   private:
      int CurrentSize, MaxSize;
      T *heap;  // element array
};

template<class T>
MaxHeap<T>::MaxHeap(int MaxHeapSize)
{// Max heap constructor.
   MaxSize = MaxHeapSize;
   heap = new T[MaxSize+1];
   CurrentSize = 0;
}

template <class T>
void Maxhead<T>::Initialize ( 3 params);	// vkc
######################################################################################

<FINAL CLASS>
A final class cannot be subclassed. This is done for reasons of security and efficiency. Accordingly, many of the Java standard library classes are final, for example java.lang.System and java.lang.String. All methods in a final class are implicitly final.

Example:

public final class MyFinalClass {...}	/// cannot be subclassed

###########################################
<FINAL METHOD>

A final method cannot be overridden by subclasses. This is used to prevent unexpected behavior from a subclass altering a method that may be crucial to the function or consistency of the class.[2]

Example:

public class MyClass {
    public final void myFinalMethod() {...}
}

<FINAL VARIABLES>

A final variable can only be assigned once. This assignment does not grant the variable immutable status. If the variable is a field of a class, it must be assigned in the constructor of its class. (Note: If the variable is a reference, this means that the variable cannot be re-bound to reference another object. But the object that it references is still mutable, if it was originally mutable.)

||||| <imP> |||||

Unlike the value of a constant, the value of a final variable is not necessarily known at compile time.

Difference from the C++ "const" type qualifier

    * In C++, a const field is not only protected from being reassigned, but there is the additional limitation that only const methods can be called on it and it can only be passed as the const argument of other methods.
    * Non-static inner classes can freely access any field of the enclosing class, final or not.

###########################################
    good book: C++/java version : http://www.brpreiss.com/books/opus5/index.html
    mark and sweep:	http://www.brpreiss.com/books/opus5/html/page424.html

###########################################
###########################################
linker: E:\My eBooks\linker10.html

###########################################
do a bit of :

polymorphissm
destructors/constructors (virtual) [[http://www.codersource.net/cpp_virtual_destructors.html]]

Say Base and Derived classes are defined:

Code:
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

<main>
	Base *Var = new Derived();
        delete Var;

If Base has a virtual dest. o/p will be like:
	Constructor: Base
	Constructor: Derived
	Destructor : Derived
	Destructor : Base

If Base has no virtual dest. o/p will be like:
	Constructor: Base
	Constructor: Derived
	Destructor : Base

# So, DIFF is : When u declare base destruc. as virtual, the Derived class dest. is also called.

''''"//m

-----------------------------------------------------------------
<TODO> : carry on spliting the file from here
	binary tree algos
	quicksort
	what are macros
	view doubly link list
	just heapify

hints:

char *b;
b = (char*) malloc (10);	// 10 bytes

void * calloc ( size_t num, size_t size );

//Allocates a block of memory for an array of num elements, each of them size bytes long, and initializes all its bits to zero.

mirrorTree() = mirror then swap

-----------------------------------------------------------------
----
    * Foo* const ptr: ptr is a const pointer to a Foo Object. The Foo object can be changed using the pointer ptr, but you can't change the pointer ptr itself.
    * const Foo* ptr: ptr points to a Foo object that is const. The Foo object can't be changed via ptr.
    * const Foo* const ptr: ptr is a const pointer to a const Foo object. Neiher can the pointer ptr be changed, nor can you change the Foo object using ptr.

-----------------------------------------------------------------
http://www.cplusplus.com/doc/tutorial/polymorphism/

In fact, that is not the case:

    Employee *emplP;

    emplP = &empl;  // make point to an Employee
    cout << "Pay: " << emplP->pay(40.0);  // calls Employee::pay()
    emplP = &mgr;  // make point to a Manager
    cout << "Pay: " << emplP->pay(40.0);  // calls Employee::pay()

By default, it is the type of the pointer (i.e., Employee), not the type of the object it points to (i.e., possibly Manager) that determines which version will be called:

    Employee *emplP;

    if (condition1) {
      emplP = new Employee(...);
    } else if (condition2) {
      emplP = new Manager(...);
    }

    cout << "Pay: " << emplP->pay(40.0);  // calls Employee::pay()

We'd prefer that it call the version of pay() that corresponds to the type of the object pointed to:

    Employee *emplP;

    emplP = &empl;  // make point to an Employee
    cout << "Pay: " << emplP->pay(40.0);  // call Employee::pay()

    emplP = &mgr;  // make point to a Manager
    cout << "Pay: " << emplP->pay(40.0);  // please--Manager::pay()?

We can get that behavior by making the pay() method virtual! We do so in its declaration:

    class Employee {
    public:
      ...
      virtual float pay(float hoursWorked) const;
      ...
    };

-----------------------------------------------------------------
----
ADOBE Question:
----

 some quest i can remember:
1. implementation of sprintf
2. how free may be implemented in C
3. a[3][4][5] = 6; write this statement with pointers
4. o/p of :
      int a =10;
      printf("smth  %d : %d ", ++a, a++);
5. there was one more quest on o/p that i dont remember now....it was
smth to do with array and we were itr it thru a ptr
6. difference b/w a constant and # define const.
7. write a generalised macro to swap 2 vars. (vars can be of int, str,
double, etc)

    #define SWAP(A, B) {struct tempStruct { char C[sizeof(A)];} \
    swap_tmp;\
    swap_tmp = *( struct tempStruct*) &A;\
    *( struct tempStruct*) &A = *( struct tempStruct*) &B;\
    *( struct tempStruct*) &B = swap_tmp;}

8.
9.
10.

1. quest from OS on producer-consumer problem...u can define a loop,
vars(but u can only set, reset the value), critical section, etc
2,3,4.  2or 3 obj type question...dont remember but were easy

empty = N, full = 0;
	producer:
	wait(empty)
		//do
	signal (full)

	consumer:
	wait (full)
		//do
	signal (empty)


5. on a x-y plane u were given 2 rectangles and for each rect. you
have {lower left x, lower left y, upper right x, upper right y} and u
have to write an algo so find that they intersect or not

http://stackoverflow.com/questions/306316/determine-if-two-rectangles-overlap-each-other

struct
{
    LONG    left;
    LONG    top;
    LONG    right;
    LONG    bottom;
} RECT;

bool IntersectRect(const RECT * r1, const RECT * r2)
// recheck
{
    return ! ( r2->left > r1->right
        || r2->right < r1->left
        || r2->top > r1->bottom
        || r2->bottom > r1->top
        );
}

The above algorithm finds the conditions at which the rectangles do not intersect and then negates the values to get the result. There is a straight forward way of doing the same algorithm, but it requires far more conditions than the one above.


6. write a func to find height of a binary tree.
7. write an algo to find all the paths from root to leaves in a binary tree.
	file:///E:/My%20eBooks/Algo/binaryt-stan.htm
8.
9.
10.


###########################################

###########################################

###########################################

Stack Shield
tack Shield is a GNU C compiler modification that works by having a function prologue copy the return address to the beginning of the data segment, and having a function epilogue check if the current value of the return address matches the saved one.

http://www.drpaulcarter.com/pcasm/

The stack, registers, and program''s file sections (data, rodata, bss, etc) have to be initialized before main() is called. C runtime library (CRT) provides this initialzsation.

CRT also provides prologue and epilogue code that is executed before and after each function is called. The prologue and epilogue code updates the stack and frame pointers.

#########################################################
GOOD LINK
http://www.iti.fh-flensburg.de/lang/algorithmen/sortieren/merge/mergen.htm
#########################################################

In C you CANNOT assign strings as:

filename = "prog.c"  /* WRONG */

strcpy( filename, "prog.c");   /* CORRECT */
#########################################################
C ascii codes:

c='\x41'; // hexadecimal constants begin
//with \x

c='\0101'; // octal constants begin with s \0

0 – character NULL ('\0')
32 – space (' ')
48 – 57 – numbers '0'-'9'
65 – 90 – capital letters 'A' to 'Z'

printf ("%c", c); // result A
printf ("%d", c); // result 65
printf ("%c", c + 32); // result a
printf ("%d", 'B' – 'A')); // result 1



#########################################################
#
#into binary macro:

#define Ob(x)  ((unsigned)Ob_(0 ## x ## uL))
#define Ob_(x) (x & 1 | x >> 2 & 2 | x >> 4 & 4 | x >> 6 & 8 |		\
	x >> 8 & 16 | x >> 10 & 32 | x >> 12 & 64 | x >> 14 & 128)



Q: So whats the right way to return a string or other aggregate?

A: The returned pointer
	should be to a statically-allocated buffer (as in the answer to question 7.5a), or
	to a buffer passed in by the caller, or
	to memory obtained with malloc, but not to a local (automatic) array.

>>>>>>>>

http://publications.gbdirect.co.uk/c_book/chapter8/const_and_volatile.html

article for C keywords : volatile / const

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
http://www.cs.sunysb.edu/~algorith/video-lectures/

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
all about infix postfix prefix:

    http://www.coders2020.com/what-is-infix-prefix-postfix-how-can-you-convert-from-one-representation-to-another-how-do-you-evaluate-these-expressions


    ~~~~~~~~~~~~~~~~~~``
    /*++

You can use domain\account as argv[1]. For instance, mydomain\scott will
grant the privilege to the mydomain domain account scott.

The optional target machine is specified as argv[2], otherwise, the
account database is updated on the local machine.

The LSA APIs used by this sample are Unicode only.

Use LsaRemoveAccountRights() to remove account rights.

Scott Field (sfield)    12-Jul-95
--*/

#ifndef UNICODE
#define UNICODE
#endif // UNICODE

#include <windows.h>
#include <stdio.h>

#include "ntsecapi.h"

NTSTATUS
OpenPolicy(
    LPWSTR ServerName,          // machine to open policy on (Unicode)
    DWORD DesiredAccess,        // desired access to policy
    PLSA_HANDLE PolicyHandle    // resultant policy handle
    );

BOOL
GetAccountSid(
    LPTSTR SystemName,          // where to lookup account
    LPTSTR AccountName,         // account of interest
    PSID *Sid                   // resultant buffer containing SID
    );

NTSTATUS
SetPrivilegeOnAccount(
    LSA_HANDLE PolicyHandle,    // open policy handle
    PSID AccountSid,            // SID to grant privilege to
    LPWSTR PrivilegeName,       // privilege to grant (Unicode)
    BOOL bEnable                // enable or disable
    );

void
InitLsaString(
    PLSA_UNICODE_STRING LsaString, // destination
    LPWSTR String                  // source (Unicode)
    );

void
DisplayNtStatus(
    LPSTR szAPI,                // pointer to function name (ANSI)
    NTSTATUS Status             // NTSTATUS error value
    );

void
DisplayWinError(
    LPSTR szAPI,                // pointer to function name (ANSI)
    DWORD WinError              // DWORD WinError
    );

void
InitLsaString(
    PLSA_UNICODE_STRING LsaString,
    LPWSTR String
    )
{
    DWORD StringLength;

    if (String == NULL) {
        LsaString->Buffer = NULL;
        LsaString->Length = 0;
        LsaString->MaximumLength = 0;
        return;
    }

    StringLength = wcslen(String);
    LsaString->Buffer = String;
    LsaString->Length = (USHORT) StringLength * sizeof(WCHAR);
    LsaString->MaximumLength=(USHORT)(StringLength+1) * sizeof(WCHAR);
}

NTSTATUS
OpenPolicy(
    LPWSTR ServerName,
    DWORD DesiredAccess,
    PLSA_HANDLE PolicyHandle
    )
{
    LSA_OBJECT_ATTRIBUTES ObjectAttributes;
    LSA_UNICODE_STRING ServerString;
    PLSA_UNICODE_STRING Server = NULL;

    //
    // Always initialize the object attributes to all zeroes.
    //
    ZeroMemory(&ObjectAttributes, sizeof(ObjectAttributes));

    if (ServerName != NULL) {
        //
        // Make a LSA_UNICODE_STRING out of the LPWSTR passed in
        //
        InitLsaString(&ServerString, ServerName);
        Server = &ServerString;
    }

    //
    // Attempt to open the policy.
    //
    return LsaOpenPolicy(
                Server,
                &ObjectAttributes,
                DesiredAccess,
                PolicyHandle
                );
}

/*++
This function attempts to obtain a SID representing the supplied
account on the supplied system.

If the function succeeds, the return value is TRUE. A buffer is
allocated which contains the SID representing the supplied account.
This buffer should be freed when it is no longer needed by calling
HeapFree(GetProcessHeap(), 0, buffer)

If the function fails, the return value is FALSE. Call GetLastError()
to obtain extended error information.

Scott Field (sfield)    12-Jul-95
--*/

BOOL
GetAccountSid(
    LPTSTR SystemName,
    LPTSTR AccountName,
    PSID *Sid
    )
{
    LPTSTR ReferencedDomain=NULL;
    DWORD cbSid=128;    // initial allocation attempt
    DWORD cchReferencedDomain=16; // initial allocation size
    SID_NAME_USE peUse;
    BOOL bSuccess=FALSE; // assume this function will fail

    for( int i=0; i< 1 ;i++)  {

    //
    // initial memory allocations
    //
    if((*Sid=HeapAlloc(
                    GetProcessHeap(),
                    0,
                    cbSid
                    )) == NULL) break;

    if((ReferencedDomain=(LPTSTR)HeapAlloc(
                    GetProcessHeap(),
                    0,
                    cchReferencedDomain * sizeof(TCHAR)
                    )) == NULL) break;

    //
    // Obtain the SID of the specified account on the specified system.
    //
    while(!LookupAccountName(
                    SystemName,         // machine to lookup account on
                    AccountName,        // account to lookup
                    *Sid,               // SID of interest
                    &cbSid,             // size of SID
                    ReferencedDomain,   // domain account was found on
                    &cchReferencedDomain,
                    &peUse
                    )) {
        if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
            //
            // reallocate memory
            //
            if((*Sid=HeapReAlloc(
                        GetProcessHeap(),
                        0,
                        *Sid,
                        cbSid
                        )) == NULL) break;

            if((ReferencedDomain=(LPTSTR)HeapReAlloc(
                        GetProcessHeap(),
                        0,
                        ReferencedDomain,
                        cchReferencedDomain * sizeof(TCHAR)
                        )) == NULL) break;
        }
        else break;
    }

    //
    // Indicate success.
    //
    bSuccess=TRUE;

    } // for ()

    //
    // Cleanup and indicate failure, if appropriate.
    //

    HeapFree(GetProcessHeap(), 0, ReferencedDomain);

    if(!bSuccess) {
        if(*Sid != NULL) {
            HeapFree(GetProcessHeap(), 0, *Sid);
            *Sid = NULL;
        }
    }


    return bSuccess;
}

NTSTATUS
SetPrivilegeOnAccount(
    LSA_HANDLE PolicyHandle,    // open policy handle
    PSID AccountSid,            // SID to grant privilege to
    LPWSTR PrivilegeName,       // privilege to grant (Unicode)
    BOOL bEnable                // enable or disable
    )
{
    LSA_UNICODE_STRING PrivilegeString;

    //
    // Create a LSA_UNICODE_STRING for the privilege name.
    //
    InitLsaString(&PrivilegeString, PrivilegeName);

    //
    // grant or revoke the privilege, accordingly
    //
    if(bEnable) {
        return LsaAddAccountRights(
                PolicyHandle,       // open policy handle
                AccountSid,         // target SID
                &PrivilegeString,   // privileges
                1                   // privilege count
                );
    }
    else {
        return LsaRemoveAccountRights(
                PolicyHandle,       // open policy handle
                AccountSid,         // target SID
                FALSE,              // do not disable all rights
                &PrivilegeString,   // privileges
                1                   // privilege count
                );
    }
}

void
DisplayNtStatus(
    LPSTR szAPI,
    NTSTATUS Status
    )
{
    //
    // Convert the NTSTATUS to Winerror. Then call DisplayWinError().
    //
    DisplayWinError(szAPI, LsaNtStatusToWinError(Status));
}

void
DisplayWinError(
    LPSTR szAPI,
    DWORD WinError
    )
{
    LPSTR MessageBuffer;
    DWORD dwBufferLength;

    //
    // TODO: Get this fprintf out of here!
    //
    fprintf(stderr,"%s error!\n", szAPI);

    if(dwBufferLength=FormatMessageA(
                        FORMAT_MESSAGE_ALLOCATE_BUFFER |
                        FORMAT_MESSAGE_FROM_SYSTEM,
                        NULL,
                        WinError,
                        GetUserDefaultLangID(),
                        (LPSTR) &MessageBuffer,
                        0,
                        NULL
                        ))
    {
        DWORD dwBytesWritten; // unused

        //
        // Output message string on stderr.
        //
        WriteFile(
            GetStdHandle(STD_ERROR_HANDLE),
            MessageBuffer,
            dwBufferLength,
            &dwBytesWritten,
            NULL
            );

        //
        // Free the buffer allocated by the system.
        //
        LocalFree(MessageBuffer);
    }
}

#define RTN_OK 0
#define RTN_USAGE 1
#define RTN_ERROR 13

//
// If you have the ddk, include ntstatus.h.
//
#ifndef STATUS_SUCCESS
#define STATUS_SUCCESS  ((NTSTATUS)0x00000000L)
#endif

int _cdecl
main(int argc, char *argv[])
{
    LSA_HANDLE PolicyHandle;
    WCHAR wComputerName[256]=L"";   // static machine name buffer
    TCHAR AccountName[256];         // static account name buffer
    PSID pSid;
    NTSTATUS Status;
    int iRetVal=RTN_ERROR;          // assume error from main

    if(argc == 1)
    {
        fprintf(stderr,"Usage: %s <Account> [TargetMachine]\n",
            argv[0]);
        return RTN_USAGE;
    }

    //
    // Pick up account name on argv[1].
    // Assumes source is ANSI. Resultant string is ANSI or Unicode
    //
    wsprintf(AccountName, TEXT("%hS"), argv[1]);

    //
    // Pick up machine name on argv[2], if appropriate
    // assumes source is ANSI. Resultant string is Unicode.
    //
    if(argc == 3) wsprintfW(wComputerName, L"%hS", argv[2]);

    //
    // Open the policy on the target machine.
    //
    if((Status=OpenPolicy(
                wComputerName,      // target machine
                POLICY_CREATE_ACCOUNT | POLICY_LOOKUP_NAMES,
                &PolicyHandle       // resultant policy handle
                )) != STATUS_SUCCESS) {
        DisplayNtStatus("OpenPolicy", Status);
        return RTN_ERROR;
    }

    //
    // Obtain the SID of the user/group.
    // Note that we could target a specific machine, but we dont.
    // Specifying NULL for target machine searches for the SID in the
    // following order: well-known, Built-in and local, primary domain,
    // trusted domains.
    //
    if(GetAccountSid(
            NULL,       // default lookup logic
            AccountName,// account to obtain SID
            &pSid       // buffer to allocate to contain resultant SID
            )) {
        //
        // We only grant the privilege if we succeeded in obtaining the
        // SID. We can actually add SIDs which cannot be looked up, but
        // looking up the SID is a good sanity check which is suitable for
        // most cases.

        //
        // Grant the SeServiceLogonRight to users represented by pSid.
        //
        if((Status=SetPrivilegeOnAccount(
                    PolicyHandle,           // policy handle
                    pSid,                   // SID to grant privilege
                    L"SeServiceLogonRight", // Unicode privilege
                    TRUE                    // enable the privilege
                    )) == STATUS_SUCCESS)
            iRetVal=RTN_OK;
        else
            DisplayNtStatus("AddUserRightToAccount", Status);
    }
    else {
        //
        // Error obtaining SID.
        //
        DisplayWinError("GetAccountSid", GetLastError());
    }

    //
    // Close the policy handle.
    //
    LsaClose(PolicyHandle);

    //
    // Free memory allocated for SID.
    //
    if(pSid != NULL) HeapFree(GetProcessHeap(), 0, pSid);

    return iRetVal;
}
'
-----------------------------------------------------
http://genestamp.sinica.edu.tw/virus/index.html
--------------------------------------------------
imake:

http://www.snake.net/software/imake-stuff/imake-faq.html
http://posix2.sourceforge.net/guide.html
http://ns.perchine.com/dyp/x/online/Imake.html#s6.2.

http://owen.sj.ca.us/~rk/howto/slides/make/slides/makerecurs.html

--------------------------------------------------
Peters solution is the one I would recommend unless you are reading large
files and/or your system has little memory available.  By reading into an
array, the entire file will be pulled into memory.  If memory use is an
issue, you could use something like this:

-----
Syntax

seek FILEHANDLE,POSITION,WHENCE


Definition and Usage

Moves to a specified position in a file. You can move relative to the beginning of the file (WHENCE = 0), the current position (WHENCE = 1), or the end of the file (WHENCE = 2). This function is mainly used with fixed length records to randomly access specific records of the file.

For WHENCE you may use the constants SEEK_SET , SEEK_CUR , and SEEK_END (start of the file, current position, end of the file) from the Fcntl module.

This function ius similar to Unix seek() system call.


~~~~~~~~~~~~~~~~~~~
open(FILE, "my_file.txt") or die;

$pos = -2;  # Use this to get past EOF and last newline

while($char ne "\n")
{
     seek FILE, $pos, 2;
     read FILE, $char, 1;
     $pos--;
}

$final = <FILE> ;
print "Last line is: $final\n";

--------------------------------------------------


==================MACRO=====================
To alter the last line of a file with an in-place edit, use the eof function as a test:

$ (echo one; echo two) > test
$ perl -i -ple 'tr/a-z/A-Z/ if eof' test
$ cat test
one
TWO
==================MACRO=====================


==================MACRO=====================

// Macro for settor methods to return if a string field is unchanged
#define AE_ReturnIfStringUnchanged(field)					\
if ( !field || (m_##field && strcmp(m_##field, field) == 0)) { return; }

// Macro for settor methods to return if a numeric field is unchanged
#define AE_ReturnIfNumUnchanged(field)		\
if ( field == m_##field ) { return; }

	$$ use like:
	  AE_ReturnIfNumUnchanged(agent_num);

2nd way:
#define SQLEXEC(s,h) sqlexec((s),(h), __FILE__, __LINE__, this_func)

use like:	SQLEXEC (statement, h_stmt)

bool
AgentDb::sqlexec
(
    const char *statement,
    HSTMT &h_stmt,
    const char *fname,
    int lno,
    const char *context
)
#define BUFZ(x) m_##x [0] = '\0'

#define QUOTEME(x) #x
the code
printf("%s\n", QUOTEME(1+2));
will expand to
printf("%s\n", "1+2");

#define dumpme(x, fmt) printf("%s:%u: %s=" fmt, __FILE__, __LINE__, #x, x)

 Two arguments can be 'glued' together using ## preprocessor operator; this allows two tokens to be concatenated in the preprocessed code.

 ------------
#define MYCASE(item,id) \
case id: \
  item##_##id = id;\
break

switch(x) {
    MYCASE(widget,23);
}
The line MYCASE(widget,23); gets expanded here into
case 23:
  widget_23 = 23;
break;

http://en.wikipedia.org/wiki/C_preprocessor

#define _STATE_TO_STRING(_st) \
  	case Veritas::HAL::SVC::HALSVC_##_st: n = #_st; break;

    _STATE_TO_STRING(STARTING);
    _STATE_TO_STRING(RUNNING);
    _STATE_TO_STRING(PAUSED);
    _STATE_TO_STRING(STOPPING);
    _STATE_TO_STRING(STOPPED);
    _STATE_TO_STRING(WARNING);
    _STATE_TO_STRING(RECOVERY);

#undef _STATE_TO_STRING
    #
    #
 ------------
==================MACRO=====================



==================THREADSAFE NUMBER THROERY=====================

threadsafe and re-entrant
~~~~~~~
A computer program or routine is described as reentrant if it can be safely called again before its previous invocation has been completed (i.e it can be safely executed concurrently).
To be reentrant, a computer program or routine:
Must hold no static (or global) non-constant data.
Must not return the address to static (or global) non-constant data.
Must work only on the data provided to it by the caller.
Must not rely on locks to singleton resources.
Must not modify its own code.[1] (unless executing in its own unique thread storage)
Must not call non-reentrant computer programs or routines.
~~~~~~~~~

http://www.developerweb.net/forum/showthread.php?t=5277

http://publib.boulder.ibm.com/infocenter/systems/index.jsp?topic=/com.ibm.aix.genprogc/doc/genprogc/writing_reentrant_thread_safe_code.htm

http://www.unix.org/whitepapers/reentrant.html

http://www.thinkingparallel.com/2006/10/15/a-short-guide-to-mastering-thread-safety/

http://en.wikipedia.org/wiki/Reentrant_(subroutine)

http://www.ibm.com/developerworks/linux/library/l-reent.html
______________________________________________________________________________________________________________________-

The URL
doesn’t change at all. Consequently, POST requests cannot be bookmarked or
emailed or, in some cases, even reloaded. That’s by design—information sent to
the server, such as your credit card number, should be sent only once.

Just remember that GET requests,
because they can be bookmarked so easily, should not be allowed to cause damage
for which the client could be held responsible. In other words, GET requests
should not be used to place an order, update a

If a number is a perfect square, it will have an odd number of factors
(e.g., 4 has factors 1, 2, 4), whereas all other numbers have an even
number of factors.


==================THREADSAFE NUMBER THROERY=====================

===============	macro platform specific=============================:

#if defined(WIN32)
  #include "VxExecPipeW32.h"
  typedef CVxExecPipeW32 CVxExecPipe;
#elif defined(SOLARIS)
  #include "VxExecPipeSolaris.h"
  typedef CVxExecPipeSolaris CVxExecPipe;

  pragma:
  #include<windows.h>
  #pragma warning(disable: 4786) // disable warning C4786: symbol greater than 255 character,
  #

===============	macro platform specific=============================:

operator overloading and const fundae:

1)     operator const char *() const { return VXEXEC_PIPE_ERROR_STRINGS[m_err]; }
2)     operator vxexec_pipe_error() const { return m_err; }

HOW to use (1)?
	say it is contained in class A { }, and u declared A a(3); call like below,
	  static const char *cch=(a);


=============     how to assign during func. signature in class block:

    EVxExecPipe(std::string cmd, vxexec_pipe_error err) : m_cmd(cmd), m_err(err) {}

vector iterator:

vector<string> vecTags;
    vector<string>::iterator itr;
    for (itr = vecTags.begin(); itr != vecTags.end(); itr++) {
        __m_sMaskingTags.push_back(*itr);
    }

    ===============================THROW + VIRTUAL:=================================

virtual int  ExecPipe(string strCmd, string sCurrentWorkingDir) throw (EVxExecPipe) = 0;

	FOR ERROR NO. DO FOLLOWING:
#include <errno.h>
            VxITLTrace(tlError, "VxExecPipeBase: cannot copy string (%s), errno %d",
                   itrenv->c_str(), errno);

	  FOR STATIC DECLARALATION IN A CLASS LIKE:
		static CVxLock m_Lock;
	DO INITIALISE LIKE:
		CVxLock CVxExecPipeW32::m_Lock;

    ===============================THROW + VIRTUAL:=================================



	????????????????????
string PointerToString(void* ptr)
{
    char szTempId[30];

#ifdef _WIN64
    sprintf(szTempId, "%I64x", ptr);
#else
    sprintf(szTempId, "%x", ptr);
#endif

    return szTempId;
}
	????????????????????

==================================	CALLOC & MALLOC=======================
void *malloc(size_t n)
returns a pointer to n bytes of uninitialized storage, or NULL if the request cannot be satisfied.

   void *calloc(size_t n, size_t size)
returns a pointer to enough free space for an array of n objects of the specified size, or NULL if
the request cannot be satisfied. The storage is initialized to zero.

The pointer returned by malloc or calloc has the proper alignment for the object in question,
but it must be cast into the appropriate type, as in
		int *ip;
 		   ip = (int *) calloc(n, sizeof(int));


==================================	CALLOC & MALLOC=======================

CONST char *p;
     here the const. keyword is coming before the "*p"
     So it affects the value pointed by "p" i.e. "*p"
     You can't change the character (value pointed by p).
     Although you can change the address stored in "p".

char CONST *p;
    same explanation as above

char * CONST p;
     here the const. keyword is coming before the "p" and
     after "*" So it affects the value of "p" (which holds
     the address). You can't change the address stored in
     "p". Although you can change the value pointed by p
     i.e. "*p"

CONST char* CONST p:
     here CONST is coming before the "*" as well as after
     the "*". Therefore, as expeected neither the address
     of nor the value pointed by "p" can be changed.

     # learn operator overloading	12:13 am (27 jan)




---------------
$_ is known as the "default input and pattern matching space"
@_ is the list of incoming parameters to a sub

hash::::

$fred{"aaa"} = "bbb";
$fred{234.5} = 456.7;
@list = keys(%fred); # @list gets ("aaa",234.5) or
# (234.5,"aaa")

@lastnames = values(%lastname); # grab the values

%fred = ("aaa","bbb",234.5,34.56); # give %fred two elements
delete $fred{"aaa"};

Hash slices can also be used to merge a smaller hash into a larger one. In this example, the smaller hash
takes precedence in the sense that if there are duplicate keys, the value from the smaller hash is used:
%league{keys %score} = values %score;


6.1 Input from STDIN

while (defined($line = <STDIN>)) {
# process $line here
}

When <STDIN> has no more lines to read, it returns undef, terminating the loop.

Reading a scalar value from <STDIN> into $_ and using that value as the controlling expression of a
loop (as in the previous example) occurs frequently enough that Perl has an abbreviation for it. Whenever
a loop test consists solely of the input operator (something like <...>), Perl automatically copies the
line that is read into the $_ variable.
while (<STDIN>) { # like "while(defined($_ = <STDIN>)) {"
chomp; # like "chomp($_)"
# other operations with $_ here
}

the diamond operator gets its data from the file or files specified
on the command line that invoked the Perl program

Each command-line argument goes into a separate element of the @ARGV array.

7. Regular Expressions	tod odododoodododo



On Mon, Jun 1, 2009 at 4:01 PM, Manish Bansode <manishbansode@gmail.com> wrote:

    my %inv_hash=();
    my $line, $lines;
    my @arr;
    my $array_ref;

    open(H,"<sample.txt");

    my $j=1;
    while(<H>)
    {
    #       $lines.=$_;
            @arr = split(/ /, $_);
            foreach $entry(@arr)
            {
                    if( exists $inv_hash{$entry} )
                    {
                            $array_ref = $inv_hash{$entry};
                            push(@$array_ref, $j);
                    }
                    else
                    {
                            my @array = ();
                            push(@array, $j);
                            $inv_hash{$entry} = \@array;
                    }
            }
            $j++;
    }

    #print "\nj=$j\nsize=".keys(%inv_hash)."\n";

    $array_ref = $inv_hash{'Vivek'};
    print "Array  : '@$array_ref'\n";


The my() operator can also be used at the outermost level of your program, outside of any subroutines
or blocks. While this isn't really a "local" variable in the sense defined above, it's actually rather useful,
especially when used in conjunction with a Perl pragma:[4]
use strict;
[4] A pragma is a compiler directive. Other directives include those to set up integer
arithmetic, overload numeric operators, or request more verbose warnings and error
messages. These are documented in Chapter 7 of Programming Perl and the perlmodlib (1)
manpage.
If you place this pragma at the beginning of your file, you will no longer be able to use variables (scalars,
arrays, and hashes) until you have first "declared" them. And you declare them with my(), like so:


We d have to look through the message for a line that begins with From: and then notice whether the
line also contains the login name, merlyn.
We could do it like this:
while (<STDIN>) { # read the input lines
if (/^From: /) { # does it begin with From:? If yes...
if (/merlyn/) { # it's from merlyn!
print "Email from Randal! It's about time!\n";
}
last; # no need to keep looking for From:, so exit
} # end "if from:"
if (/^$/) { # blank line?
last; # if so, don't check any more lines
}
} # end while

LINE: while (<STDIN>) {
last LINE if /^From: /;
}
See how much easier that is to write? And you can even read it in a normal English way: "last line if it
begins with From."
Other parallel forms include the following:
exp2 unless exp1; # like: unless (exp1) { exp2; }
exp2 while exp1; # like: while (exp1) { exp2; }
exp2 until exp1; # like: until (exp1) { exp2; }

open(FILEHANDLE,"somename");
This invocation opens the filehandle for reading.

Important note: A function pointer always points to a function with a specific signature! Thus all functions, you want to use with the same function pointer, must have the same parameters and return-type!

The message at death (built from the argument to die) has the Perl program name and line number
automatically attached, so you can easily identify which die was responsible for the untimely exit. If
you don't like the line number or file revealed, make sure that the death text has a newline on the end. For
example,'
die "you gravy-sucking pigs";
prints the file and line number, while
die "you gravy-sucking pigs\n";
does not.


http://affy.blogspot.com/p5be/ch12.htm

Another handy thing inside die strings is the $! variable, which contains the error string describing the
most recent operating system error. It's used like this:
open(LOG, ">>logfile") || die "cannot append: $!";
This might end up saying "cannot append: Permission denied" as part of the message.

There's also the "close call" function, which most people know as warn. It does everything die does,
just short of actually dying. Use it to give error messages on standard error without a lot of extra hassle:
open(LOG,">>log") || warn "discarding logfile output\n";

$name = "index.html";
if (-e $name) {
print "I see you already have a file named $name\n";
} else {
print "Perhaps you'd like to make a file called $name\n";
}


11. Formats toooooooooodooooooooooo

The expansion of arguments like * or /etc/host* into the list of matching filenames is called
globbing. Perl supports globbing through a very simple mechanism: just put the globbing pattern
between angle brackets or use the more mnemonically named glob function.
@a = </etc/host*>;
@a = glob("/etc/host*");


while (defined($nextname = </etc/host*>)) {
print "one of the files is $nextname\n";
}

---------------
extern "C" is meant to be recognized by a C++ compiler and to notify the compiler that the noted function is (or to be) compiled in C style.

Take an example, if you are working on a C++ project but it also deals with some existing C functions/libraries.
You want to wrap them in a C++ module or compile them with other C++ objects without any C++ compiler errors, then you would declare the C function prototypes in an extern "C" block to notify the compiler that they would be compiled along with other C++ functions into one module.

For example:

my_C_CPP_Header.h:

#ifndef MY_C_CPP_HEADER
#define MY_C_CPP_HEADER


/*check if the compiler is of C++*/
#ifdef __cplusplus
extern "C" {
int myOtherCfunc(int arg1, int arg2); /* a C function */
}
#endif

void myCppFunction1(); /* C++ function */
void myCppFunction2(); /* C++ function */

/*check if the compiler is of C++ */
#ifdef __cplusplus
}
#endif

#endif


Now all three functions are comiled into one module by C++ compiler.

----------------------
FRIEND CLASSES:

say you want to create a "dynamic array class" , and you want an iterator thru it. It would be easy to declare "iterator class" as friend of DAC because it might have to access few private memebers of DAC.

If, its not a freind class, then its a meaningless separation b/w the two classes.

----------------------
    Vector(const Vector& other) // Copy constructor

    in copy constructor...pass alwways by reference
----------------------
----------------------
windows bat file .... taking input

@echo off
:A
Cls
echo MESSENGER
set /p n=User:
set /p m=Message:
echo %n%
echo %m%
#net send %n% %m%
Pause
Goto A

----------------------
http://mypchell.com/guides/34-guides/69-156-useful-run-commands
http://www.robvanderwoude.com/ntadmincommands.php#Cmd20
http://lee.org/blog/useful-windows-commands/
http://my.opera.com/allbits/blog/show.dml/186390
----------------------
----------------------
Note that sprintf() does the opposite of a function like atoi() – where atoi() converts a string into a number, sprintf() can be used to convert a number into a string. For example, the following code uses sprintf() to convert an integer into a string of characters:

     char result[100];
     int num = 24;
     sprintf( result, "%d", num );
This code is similar, except that it converts a floating-point number into an array of characters:

     char result[100];
     float fnum = 3.14159;
     sprintf( result, "%f", fnum );
Note that this function does not check the bounds of the buffer and therefore creates the risk of a buffer overflow. A secure alternative is snprintf

So, this way we can convert decimal = 24 to hex = 18 by following :
     char result[100];
     int num = 24;
     sprintf( result, "%X", num );
     cout<<endl<<result<<endl;

http://www.chris-lott.org/resources/cstyle/indhill-cstyle.html
http://www.cplusplus.com/reference/clibrary/cstdio/sprintf/
----------------------
~~~~~~~~~~~ Typedef and malloc ~~~~~~~~~~~`

/* Program 9.1 from PTRTUT10.HTM 6/13/97 */
#include <stdio.h>
#include <stdlib.h>
#define COLS 5
typedef int RowArray[COLS];
RowArray *rptr;
int main(void)
{
int nrows = 10;
int row, col;
rptr = malloc(nrows * COLS * sizeof(int));
for (row = 0; row < nrows; row++)
{
for (col = 0; col < COLS; col++)
{
rptr[row][col] = 17;
}
}
return 0;
}


----------------------
When too much memory is used (i.e. when the program tries to access memory that is outside the region reserved for the call stack), the stack is said to "overflow", typically resulting in program crash if no provision is made for this occurrence in the program. Stack overflows can occur either because too many functions functions are called (and haven't finished) in a computer program, or a function allocates too much space for automatic variables. The most common cause of stack overflows is infinite recursion.

~~~~~~~~~~~

In computers, the front side bus (FSB) or system bus is a term for the physical bi-directional data bus that carries all electronic signal information between the central processing unit (CPU) and other devices within the system such as random access memory (RAM), AGP video cards, PCI expansion cards, hard disks, the memory containing the system BIOS, etc.

~~~~~~~~~~~
The primary function of the BIOS is to prepare the machine so other software programs stored on various media (such as hard drives, floppies, and CDs) can load, execute, and assume control of the computer. This process is known as booting up.

~~~~~~~~~~~
Although a CPU may be 64-bit internally, its external data bus or address bus may have a different size, either larger or smaller, and the term is often used to describe the size of these buses as well. For instance, many current machines with 32-bit processors use 64-bit buses (e.g. the original Pentium and later CPUs), and may occasionally be referred to as "64-bit" for this reason. The term may also refer to the size of an instruction in the computer's instruction set or to any other item of data (e.g. 64-bit double-precision floating-point quantities are common). Without further qualification, however, "64-bit" computer architecture generally has integer registers that are 64 bits wide, which allows it to support (both internally and externally) 64-bit "chunks" of integer data.

~~~~~~~~~~~
A segmentation fault (often shortened to segfault) is a particular error condition that can occur during the operation of computer software. A segmentation fault occurs when a program attempts to access a memory location that it is not allowed to access, or attempts to access a memory location in a way that is not allowed (for example, attempting to write to a read-only location, or to overwrite part of the operating system).

~~~~~~~~~~~
http://aarkloninfo.blogspot.com/2008/04/tree-from-preorder-and-inorder.html

construct btree from inorder + preorder info

#################### #<code by vkc> ######################

node * recons( string pre, int preindex, string ino, int l, int h) {
	// do some error checking
	c = pre.at(preindex++);			// preindex < pre.length()
	whr = ino.find(c) // !=string::npos;
	node *n = new node (c);

	ch = pre.at(preindex);
	// if ch exists in left subtree, make it
	if ( ino.substr(l, whr-1).find(ch) != npos)
		n->left = recons (pre, preindex, ino, l, whr-1);
	// if ch exists in right subtree, make it
	if ( ino.substr(whr+1, h).find(ch) != npos)
		n->right = recons (pre, preindex, ino, whr+1, h);
}


# another code by akshya
# 	fit the tree in array, using 2i+1, 2i+2 for left/right child respectively.

~~~~~~~~~~~
very gud gdb tutorial: (first one)
http://www.unknownroad.com/rtfm/gdbtut/gdbtoc.html
http://www.delorie.com/gnu/docs/gdb/gdb_29.html
http://arioch.unomaha.edu/~jclark/gdb_plus.html
http://www.cs.umd.edu/~srhuang/teaching/cmsc212/gdb-tutorial-handout.pdf

~~~~~~~~~~~
http://www.catonmat.net/blog/low-level-bit-hacks-you-absolutely-must-know/

Bit Hack #1. Check if the integer is even or odd.

if ((x & 1) == 0) {
  x is even
}
else {
  x is odd
}

Bit Hack #2. Test if the n-th bit is set.

if (x & (1<<n)) {
  n-th bit is set
}
else {
  n-th bit is not set
}


Bit Hack #3. Set the n-th bit.

y = x | (1<<n)


Bit Hack #4. Unset the n-th bit.

y = x & ~(1<<n)


Bit Hack #5. Toggle the n-th bit.

y = x ^ (1<<n)


Bit Hack #6. Turn off the rightmost 1-bit.

y = x & (x-1)


Bit Hack #7. Isolate the rightmost 1-bit.

y = x & (-x)


Bit Hack #8. Right propagate the rightmost 1-bit.

y = x | (x-1)


Bit Hack #9. Isolate the rightmost 0-bit.

y = ~x & (x+1)			~011011 & 011100	= 100100 & 011100	= 000100


Bit Hack #10. Turn on the rightmost 0-bit.

y = x | (x+1)			011011 | 011100

http://www.catonmat.net/blog/perl-one-liners-explained-part-four/
http://www.catonmat.net/blog/bit-hacks-header-file/
http://www.catonmat.net/blog/perl-one-liners-explained-part-five/
http://www.catonmat.net/blog/secret-perl-operators/

~~~~~~~~~~~
perl extensions :
	http://docstore.mik.ua/orelly/perl/prog3/ch21_03.htm
	http://perldoc.perl.org/perlxs.html
	+ some vasco examples
~~~~~~~~~~~
~~~~~~~~~~~
html code:

<div id="menu" align="right" >
<a href="">HOME</a> |
<a href="">CONTACT</a> |
<a href="">ABOUT</a>
</div>

<div id="content" align="left" bgcolor="white">
<h5>Content Articles</h5>
<p>This paragraph would be your content
 paragraph with all of your readable material.</p>
</div>

~~~~~~~~~~~
print "\npid = $$";     prints pid :

----------------------------------------------------
I have a script that does an ftp from a SCO UNIX server to windows server to get files from the windows server. The script is set in the cron to run every xx minutes. Sometimes the script will hang and leave a process running. This can bog down the UNIX server. I want to be able to do two things. 1. I want to make sure that the script doesn't hang - so it should terminate after xx minutes (the files are very small that it is getting). And 2. I want the script to test to make sure that it is not already running, before starting again. THANKS
Dave's Answer:

A classic solution to this is to create a "semaphore" file, something like this at the beginning of the script:
cat $$ > /tmp/program.lock

then at the end of the script you delete it:
rm /tmp/program.lock

(or, if you want to be more fancy, use the trap command to specify that on exit condition 0 the temp file should be deleted: "trap "rm /tmp/program.lock" 0")

if [ -f /tmp/program.lock ] ; then
  # the lock file already exists, so what to do?
  if [ "$(ps -p `cat /tmp/program.lock` | wc -l)" -gt 1 ]; then
    # process is still running
    echo "$0: quit at start: lingering process `cat /tmp/program.lock`"
    exit 0
  else
    # process not running, but lock file not deleted?
    echo " $0: orphan lock file warning. Lock file deleted."
    rm /tmp/program.lock
  fi
fi


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Note that, in ASP.NET, you must place content inside <Form> tags, within the <BODY> tags.

Now build and view the web page by pressing Ctrl + F5

2. Use the menu option Build -> Build Solution
3. Use the keyboard shortcut Ctrl + Shift + B

Pressing Ctrl + Shift + B will only build the web site, but it will not launch the site.

~~~~~~~~~~~
build process: http://msdn.microsoft.com/en-us/library/z7kx322x(v=VS.80).aspx

http://www.windevblog.com/?p=194
~~~~~~~~~~~
~~~~~~~~~~~
~~~~~~~~~~~
http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html

http://www.adp-gmbh.ch/cpp/gcc/create_lib.html

export PS1='\[\033[32m\][\u@\h:\w]\[\033[37m\]$'



If the macro name is a single letter, the parentheses or braces are optional (i.e. $X, $(X) and ${X} all mean “the value of macroX”).

>>>>>>>>>>>>>>>>>> ################# C compilation stages ################## <<<<<<<<<<<<<<<

The first stage of the compilation process is the use of the preprocessor to expand macros and included header files. To perform this stage, GCC executes the following command:(35)

$ cpp hello.c > hello.i
The result is a file ‘hello.i’ which contains the source code with all macros expanded. By convention, preprocessed files are given the file extension ‘.i’ for C programs and ‘.ii’ for C++ programs. In practice, the preprocessed file is not saved to disk unless the -save-temps option is used.

>>>>>>>>>>>>..

The next stage of the process is the actual compilation of preprocessed source code to assembly language, for a specific processor. The command-line option -S instructs gcc to convert the preprocessed C source code to assembly language without creating an object file:

$ gcc -Wall -S hello.i
The resulting assembly language is stored in the file ‘hello.s’. Here is what the Hello World assembly language for an Intel x86 (i686) processor looks like:

$ cat hello.s
    .file  "hello.c"
    .section  .rodata
.LC0:
    .string  "Hello, world!\n"
    .text
.globl main
    .type  main, @function
main:
    pushl  %ebp




    movl  %esp, %ebp
    subl  $8, %esp
    andl  $-16, %esp
    movl  $0, %eax
    subl  %eax, %esp
    movl  $.LC0, (%esp)
    call  printf
    movl  $0, %eax
    leave
    ret
    .size  main, .-main




    .ident  "GCC: (GNU) 3.3.1"



Note that the assembly language contains a call to the external function printf.


>>>>>>>>>>>>>>>>>>>>>>>>>>>.
The purpose of the assembler is to convert assembly language into machine code and generate an object file. When there are calls to external functions in the assembly source file, the assembler leaves the addresses of the external functions undefined, to be filled in later by the linker. The assembler can be invoked with the following command line:

$ as hello.s -o hello.o
As with GCC, the output file is specified with the -o option. The resulting file ‘hello.o’ contains the machine instructions for the Hello World program, with an undefined reference to printf.

>>>>>>>>>>>>>>>>>>>>>>>>>


The final stage of compilation is the linking of object files to create an executable. In practice, an executable requires many external functions from system and C run-time (crt) libraries. Consequently, the actual link commands used internally by GCC are complicated. For example, the full command for linking the Hello World program is:

$ ld -dynamic-linker /lib/ld-linux.so.2 /usr/lib/crt1.o /usr/lib/crti.o /usr/lib/gcc-lib/i686/3.3.1/crtbegin.o -L/usr/lib/gcc-lib/i686/3.3.1 hello.o -lgcc -lgcc_eh -lc -lgcc -lgcc_eh /usr/lib/gcc-lib/i686/3.3.1/crtend.o /usr/lib/crtn.o

Fortunately there is never any need to type the command above directly--the entire linking process is handled transparently by gcc when invoked as follows:

$ gcc hello.o
This links the object file ‘hello.o’ to the C standard library, and produces an executable file ‘a.out’:

$ ./a.out Hello, world!
An object file for a C++ program can be linked to the C++ standard library in the same way with a single g++ command.

>>>>>>>>>>>>>>>>>>>>>>>>>>
#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;

my $fpath = "/home/user/hello/hey.pl";

print "Original  : " . $fpath . "\n";

my($filename, $directories) = fileparse($fpath);

print "Filename  : " . $filename    . "\n";
print "Directory : " . $directories . "\n";

~~~~~~~~~~~
$var = 10;
print(qq(This is a single quoted string with interpolation, $var));


It will produce following results:

This is a single quoted string with interpolation, 10
~~~~~~~~~~~
print <<"EOF";
<HTML>
<HEAD>
<TITLE>Thank you</TITLE>
</HEAD>

<BODY>

<H1>Thank you</H1>

<P>Thank you for your form submission. You will be hearing
from me shortly.</P>

<P>Return to
<A HREF="$site_url">$site_name</A>.</P>

</BODY>
</HTML>
EOF
~~~~~~~~~~~
~~~~~~~~~~~
~~~~~~~~~~~
~~~~~~~~~~~

----------------------
----------------------
----------------------
----------------------
----------------------
----------------------
