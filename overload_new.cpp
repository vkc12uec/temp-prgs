/*

   This is a test for the overloaded "new" operator.
   This is described in section 5.3.3 of the ANSI
   C++ standard.  This test compiles under Sun Solaris
   and on Windows NT with the Visual C++ 4.1 compiler.

   When executed, this test should print:   

      constructor for base_one called
      constructor for base_two called
      constructor for base_three called
      constructor for base_four called
      one
      kind = one
      a = 1
      two
      kind = two
      a = 2, b = 3
      three
      kind = three
      a = 4, b = 5, c = 6
      four
      kind = four
      a = 7, b = 8, c = 9, d = 10


 */


#include <string.h>
#include <stdlib.h>
#include <stdio.h>


class pool {
public:
    void *GetMem( unsigned int num_bytes )
    {
        return malloc( num_bytes );
    }
};


enum { bad_sub,
       one,
       two,
       three,
       four };

class base {
public:
    unsigned int kind;

    base( unsigned int k) { kind = k; }

    void pr_kind()
    {
        printf("kind = ");
        switch ( kind ) {
        case one:
            printf("one\n");
            break;
        case two:
            printf("two\n");
            break;
        case three:
            printf("three\n");
            break;
        case four:
            printf("four\n");
            break;
        default:
            printf("bad_sub\n");
        }
    }


    void *operator new( unsigned int num_bytes, pool *mem)
    {
        
        return mem->GetMem( num_bytes);
    }

    virtual void pr(void) = 0;
};


class base_one : public base {
private:
    int a;
public:
    base_one( unsigned int k = bad_sub ) : base( k ) 
    {
        printf("constructor for base_one called\n");
        a = 1;
    }
    ~base_one(void)
    {
        printf("destructor for base_one called\n");
    }
    void pr(void) 
    {
        printf("one\n");
        pr_kind();
        printf("a = %d\n", a );
    }
};

class base_two : public base {
private:
    int a, b;
public:
    base_two( unsigned int k  = bad_sub ) : base( k ) 
    {
        printf("constructor for base_two called\n");
        a = 2;
        b = 3;
    }
    ~base_two(void)
    {
        printf("destructor for base_two called\n");
    }
    void pr(void) 
    {
        printf("two\n");
        pr_kind();
        printf("a = %d, b = %d\n", a, b );
    }
};

class base_three : public base {
private:
    int a, b, c;
public:
    base_three( unsigned int k  = bad_sub ) : base( k ) 
    {
        printf("constructor for base_three called\n");
        a = 4;
        b = 5;
        c = 6;
    }
    ~base_three(void)
    {
        printf("destructor for base_three called\n");
    }
    void pr(void) 
    {
        printf("three\n");
        pr_kind();
        printf("a = %d, b = %d, c = %d\n", a, b, c );
    }
};

class base_four : public base {
private:
    int a, b, c, d;
public:
    base_four( unsigned int k  = bad_sub ) : base( k ) 
    {
        printf("constructor for base_four called\n");
        a = 7;
        b = 8;
        c = 9;
        d = 10;
    }
    ~base_four(void)
    {
        printf("destructor for base_four called\n");
    }
    void pr(void) 
    {
        printf("four\n");
        pr_kind();
        printf("a = %d, b = %d, c = %d, d = %d\n", a, b, c, d );
    }
};



main()
{
    base *pB1;
    base *pB2;
    base *pB3;
    base *pB4;
    pool mem;

    pB1 = new( &mem ) base_one( one );
    pB2 = new( &mem ) base_two( two );
    pB3 = new( &mem ) base_three( three );
    pB4 = new( &mem ) base_four( four );

    pB1->pr();
    pB2->pr();
    pB3->pr();
    pB4->pr();

}
