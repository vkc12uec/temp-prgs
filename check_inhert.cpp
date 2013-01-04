

#include "topcoder_header.h"

class mother {
  private :
    int a;
  public :
    mother () { this.a = 10; }
    void printa() { cout << "\npublic a = " << a; }
  protected :
    void printb() { cout << "\npublic b = " << a; }
};

class dau1 : public mother {
  int b;
};

class dau2 : private mother {
  int b;
};
class dau3 : protected mother {
  int b;
};

int main () {
  dau1 d1;
  d1.printa();
  d1.printb();
  return 0;
}
