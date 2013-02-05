
#include "topcoder_header.h"
#include "math.h"

int main () {
  int n;

  cin>>n;

  vi arr(n+1, true);

  arr[0]=false;
  arr[1]=false;
  arr[2]=true;
  int m = sqrt (n);

  for (int i=2; i<= m ; i++)
    if (arr[i] == true) {
      int base = i*i;

      for (; base <= n; base+=i)
        arr[base]=false;
    }

  int num=0;
  tr (arr, it) {
    if (*it == true)
      cout <<"-- "<< num;
    num++;
  }

  return 0;
}
