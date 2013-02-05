
// topcoder tutorial.
#include <iostream>
#include <stdio.h>
#include <stack>
#include <algorithm>
#include <stdlib.h>

#define sz(a) int((a).size()) 
#define pb push

using namespace std;

typedef pair<int,double> ii; 
typedef std::stack< pair<int, double> > StackOfPairs; 

void newTimeSeries (StackOfPairs &s1, StackOfPairs &s2, StackOfPairs&s3);

int main () {
  StackOfPairs s1, s2, s3;

  s1.pb ( ii(230, 1274) );
  s1.pb ( ii(15, 1275) );
  s1.pb ( ii(4, 1275) );
  s1.pb ( ii(0, 1250) );

  s2.pb ( ii(198, 1679.75) );
  s2.pb ( ii(30, 1679.5) );
  s2.pb ( ii(10, 1682.0) );
  s2.pb ( ii(0, 1680.5) );

  newTimeSeries(s1, s2, s3);

  StackOfPairs s4;

  while ( !s3.empty() ) {
    s4.pb ( ii(s3.top().first, s3.top().second) );
    s3.pop();
  }
  cout << "\n Time \t\t Value \n";

  while ( !s4.empty() )
  {
    cout << "\n " << s4.top().first << " \t\t " << s4.top().second;
    s4.pop();
  }

  return 0;
}

void newTimeSeries (StackOfPairs &s1, StackOfPairs &s2, StackOfPairs&s3) {
  int curr = 0;   // start time
  ii top1, top2;
  const int DIFF = 10;
  double diff=0;

  while (1) {

    /*
     * For next 10s , keep popping from Stacks if top().time < Summation(10)
     */

    if ( sz(s1) == 0 || sz(s2) == 0)
      break;

    while (sz(s1) != 0) {
      if ( s1.top().first == curr) {
        top1 = s1.top();
        break;
      }
      else if ( s1.top().first > curr )
        break;
      else if ( s1.top().first < curr) {
        top1 = s1.top();
        s1.pop();
      }
    }

    while (sz(s2) != 0) {
      if ( s2.top().first == curr) {
        top2 = s2.top();
        break;
      }
      else if ( s2.top().first > curr )
        break;
      else if ( s2.top().first < curr) {
        top2 = s2.top();
        s2.pop();
      }
    }

    diff = top1.second - top2.second;
    s3.pb ( ii(curr, diff) );

    curr += DIFF;     // inc time
  }   // while

  if (sz(s1) == 0) {
    // S1 price becomse const
    while (1) {

      if (sz(s2) == 0)
        break;

      while (sz(s2) != 0) {
        if ( s2.top().first == curr) {
          top2 = s2.top();
          break;
        }
        else if ( s2.top().first > curr )
          break;
        else if ( s2.top().first < curr) {
          top2 = s2.top();
          s2.pop();
        }
      }

      diff = top1.second - top2.second;
      s3.pb ( ii(curr, diff) );
      curr += DIFF;
    }
  }

  if (sz(s2) == 0) {
    // S2 price becomes const
    while (1) {

      if (sz(s1) == 0)
        break;

      while (sz(s1) != 0) {
        if ( s1.top().first == curr) {
          top1 = s1.top();
          break;
        }
        else if ( s1.top().first > curr )
          break;
        else if ( s1.top().first < curr) {
          top1 = s1.top();
          s1.pop();
        }
      }

      diff = top1.second - top2.second;
      s3.pb ( ii(curr, diff) );
      curr += DIFF;
    }
  }
}
