#include <iostream>
#include <exception>
using namespace std;

class myexception: public exception
{
const char* what() const throw()
//    virtual const char* what() const throw()
  {
    return "My exception happened";
  }
} myex;

int main () {
  try
  {
    throw myex;
  }
  catch (exception& e)
  {
    cout << e.what() << endl;
  }
system("PAUSE");
  return 0;
}

