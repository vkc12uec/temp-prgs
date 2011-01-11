#include <iostream>
using namespace std;


class Base{
public:
Base(){cout << "Base()" << endl;}
Base(const Base&){cout << "Base(const Base&)" << endl;}
~Base(){cout << "~Base()" << endl;}
};


Base func(Base b){return b;}


void test1(){
Base a;
func(a);
}


void test2(){
Base a;
Base b = func(a);
}

void f(){
static int x=5;
}

int main(){

f();
cout << x;
return 0;

test1();
cout << "\n-----------------";
test2();
return 0;
}


