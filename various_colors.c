

#if 0
#include <iostream>
 #include <cstdlib>


int main()
{ 
  while(true)
  {
    system("Color 1A");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color 2B");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color 3C");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color 4D");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color 5E");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color 6F");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color A1");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color B2");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color C3");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color D4");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color E5");
    std::cout << "\t\t\t    Hello World" << std::endl;
    system("Color F6");
    std::cout << "\t\t\t    Hello World" << std::endl;
  break;
  }
  return 0;
}

#include <iostream>
#include <string>
 #include <stdlib.h>

int main(int argc, char ** argv)
{
    std::string default_console = "\033["+itoa(0)+"m";
    for (int i = 30; i <= 37; i++)
    {
        std::string color = "\033[0;"+itoa(i)+"m";

        std::cout<<color<<"test "<<i<<std::endl;

        color = "\033[1"+itoa(i)+"m";

        std::cout<<color<<"test "<<i<<" bold"<<std::endl;
        std::cout<<default_console<<std::endl;

    }

    std::cout << "Done" << std::endl;

    return 0;
}

#endif 

#include<stdio.h>

int main () {
  printf ("\x1b\x5b1;31;40m\tMerry Christmas\n");
  return 0;
}
