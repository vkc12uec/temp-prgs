
#include <iostream>
#include <stack>
#include <vector>
#include <algorithm>

#define sz(a) int((a).size()) 
#define pb push

using namespace std;

typedef std::vector< pair<int, double> > vp; 
typedef pair<int,double> ii; 
typedef std::stack< pair<int, double> > sp; 

void get_diff_series (sp &v1, sp &v2, sp&v3) {
  // new series every 10 s. Keep on popping if top_time < intervals(10)
  //
  int curr = 0;   // start time
  const int LAG = 10;
  double diff=0;
  ii close1, close2;

  while (1) {
    if ( sz(v1) == 0 || sz(v2) == 0)
      break;

    /*
       if (v1.top().first == curr && v2.top().first == curr  ) {
       diff = v1.top().second - v2.top().second;
       v3.pb ( ii(curr, diff) );

       v1.pop();
       v2.pop();
       }
       else {
       */
    // get their closest timestamps to curr

    while (sz(v1) != 0) {
      if ( v1.top().first == curr) {
        close1 = v1.top();
        break;
      }
      else if ( v1.top().first > curr )
        break;
      else if ( v1.top().first < curr) {
        close1 = v1.top();
        v1.pop();
      }
    }

    while (sz(v2) != 0) {
      if ( v2.top().first == curr) {
        close2 = v2.top();
        break;
      }
      else if ( v2.top().first > curr )
        break;
      else if ( v2.top().first < curr) {
        close2 = v2.top();
        v2.pop();
      }
    }

    diff = close1.second - close2.second;
    v3.pb ( ii(curr, diff) );
    //} //else

    curr += LAG;
  }   // while

  if (sz(v1) == 0) {
    // v1 price is constant: close1
    while (1) {

      if (sz(v2) == 0)
        break;

      while (sz(v2) != 0) {
        if ( v2.top().first == curr) {
          close2 = v2.top();
          break;
        }
        else if ( v2.top().first > curr )
          break;
        else if ( v2.top().first < curr) {
          close2 = v2.top();
          v2.pop();
        }
      }

      diff = close1.second - close2.second;
      v3.pb ( ii(curr, diff) );
      curr += LAG;
    }
  }

  if (sz(v2) == 0) {
    // v2 price is constant: close2
    while (1) {

      if (sz(v1) == 0)
        break;

      while (sz(v1) != 0) {
        if ( v1.top().first == curr) {
          close1 = v1.top();
          break;
        }
        else if ( v1.top().first > curr )
          break;
        else if ( v1.top().first < curr) {
          close1 = v1.top();
          v1.pop();
        }
      }

      diff = close1.second - close2.second;
      v3.pb ( ii(curr, diff) );
      curr += LAG;
    }
  }
}

int main () {
  /*
     Time	Price	Time	Price
     0	1250.00	0	1680.50
     4	1275.00	10	1682.00
     15	1275.00	30	1679.50
     230	1274.00	198	1679.75
   * 
   */

  sp v1, v2, v3;


  v1.pb ( ii(230, 1274) );
  v1.pb ( ii(15, 1275) );
  v1.pb ( ii(4, 1275) );
  v1.pb ( ii(0, 1250) );

  v2.pb ( ii(198, 1679.75) );
  v2.pb ( ii(30, 1679.5) );
  v2.pb ( ii(10, 1682.0) );
  v2.pb ( ii(0, 1680.5) );


  get_diff_series (v1, v2, v3);
  //for_each (v3, display);
  //ii temp = v1.top();
  //c//out << "\n " << v1.top().first;
 

 while ( !v3.empty() ) {
   cout << "\n " << v3.top().first << " | " << v3.top().second;
   v3.pop();
 }

  return 0;
}
