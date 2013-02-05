
/*
 * Input limit till - Hundred Billion
 *
input: 561 => output: Five Hundred Sixty One
input: 12340982 => Output: Twelve million three hundred  forty  thousand nine hundred eighty two

*/

#include <iostream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include "climits"

using namespace std;

void expand(long, string);  

const char *tens[]={" "," "," twenty"," thirty"," forty"," fifty"," sixty","seventy"," eighty"," ninety"};
const char *ones[] = {" "," one"," two"," three"," four"," five"," six"," seven","eight"," nine"," ten"," eleven"," twelve"," thirteen"," fourteen","fifteen"," sixteen"," seventeen"," eighteen"," nineteen"};

//1000k = 1 mil
//1000 mil = 1 bil

int main()
{
  unsigned long long n;

  cout << "\nEnter num (0-12) digits ";
  cin >> n;

  if(n<=0)
    printf("Enter numbers greater than 0");
  else
  {
    // 12,340,982
    // 2,147,483,647
    expand((n/1000000000),"billion");
    expand(((n/1000000)%1000),"million");
    expand(((n/1000)%1000),"thousand");
    expand(((n/100)%10),"hundred");
    expand((n%100)," ");

  }

  return 0;
}

/*
   2147483647
   two billion one hundred forty seven million four hundred eighty three thousand six hundred forty seven
   groups of three
   */

void expand(long n,string ch)
{
  //cout << "\n\t\tparams: n= " << n << " | ch = " << ch << "\n";

  if (n/100 > 0) {
    expand(((n/100)%10),"hundred");
    expand((n%100)," ");
    cout << ch;
    return;
  }

  if (n>19)
    cout << tens[n/10]<<" "<<ones[n%10] << " ";
  else
    cout << ones[n] << " ";   

  if(n)
    cout << ch << " "; 
}

