#include<iostream>
#include<cstdlib>

using namespace std;

int main(int argc, char *argv[])
{
    int a;
    int index = 1;
    int n[1600];

    for(int i =1 ;; i++)
    {
        a = i;
        while(i % 2 == 0)
        {
            i = i / 2;
        }

        while(i % 3 == 0)
        {
            i = i / 3;
        }

        while(i % 5 == 0)
        {
            i = i / 5;
        }
        if(i == 1)
            n[index++] = a;
        if(index == 1501)
            break;
        i = a;
    }
    cout << "The 1500'th ugly number is " << n[1500] << ".";
    system("PAUSE");
    return EXIT_SUCCESS;
}
