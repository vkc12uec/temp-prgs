
// HanoiNK.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "iostream"
#include "vector"
#include "queue"
#include "iostream"
#include "map"
#include "string"
#include "algorithm"
#include <stdlib.h>
#include <iterator>
#include <stack>
#include <sstream>
#include "time.h"

using namespace std;

#define sz(a) int((a).size()) 
#define pb push_back 
#define all(c) (c).begin(),(c).end() 
#define tr(c,i) for( decltype ((c).begin()) i = (c).begin(); i != (c).end(); i++ )
#define present(c,x) ((c).find(x) != (c).end())  // map | set
#define cpresent(c,x) (find(all(c),x) != (c).end())  // vector
#define FLU cout.flush ();return ;

typedef vector<int> vi;
typedef vector< vi > vvi;
typedef pair <int, int> ii;
typedef vector< ii > vii;
typedef vector< string > vs;

/*
Sample Input #01:

6 4
4 2 4 3 1 1
1 1 1 1 1 1
*/

void make_state (vvi &tempSorted, int k, string tmp);
vii possible_moves (const vvi& front, const int& k);
string get_state (const vvi &vec);
void bfs (vvi &, const vvi &, int );
void getTokens (string input, vs &tokens);
void solveHanoi ();
void testPassing ();
void pass1 (vvi tmp);
void pass2 (const vvi &);


int _tmain(int argc, _TCHAR* argv[])
{
  solveHanoi ();
  return 0;
}

void solveHanoi () {
  
  int n,k;
  string start, end, tmp;

  cin >> n >> k;

  vvi init(k+1, vi(0)), term(k+1, vi(0));   // kpegs   , ints sorted front to top

  cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(init, k, tmp);

  //cout << "\n mid ";

  tmp="";
  //cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(term, k, tmp);

#if test
  // test init state
  tr (init, it) {
    printVector (*it);
    cout << "\n -- \n";
  }
  tr (term, it) {
    printVector (*it);
    cout << "\n ** \n";
  }


  cout << "\n init state " << get_state (init);
  cout << "\n term state " << get_state (term);

  //test possible moves
  vii moves = possible_moves (init, k);
  tr (moves, it) {
    cout << "\n Peg " <<it->first << " to Peg " << it->second;
  }
#endif

  cout << "\n init state " << get_state (init);
  cout << "\n term state " << get_state (term);

  bfs (init, term, k);

}

void bfs (vvi &init, const vvi &term, int k) {
//#if 0
  map <string, int> cost;
  //map <string, bool> movesDone;
  queue <vvi*> Q;
  string term_state = get_state(term);
  string init_state = get_state(init);
  int fcost=-1; //final cost

  if (term_state == init_state) {
    cout << "\n fcost = 0";
    return;
  }

  //base
  int levelCost=0;
  cost[get_state(init)] = levelCost;
  //cost[get_state(term)] = fcost;
  Q.push (&init);
  vii pair_moves;

  while (1) {
    if (sz(Q) == 0)
      break;

    vvi* curr = Q.front();
    Q.pop();

    string curr_state = get_state(*curr);
    int curr_cost = cost[curr_state];

    if (curr_state == term_state) {
      fcost = cost[curr_state];
      break;
    }
    else {
      pair_moves = possible_moves (*curr, k);
      stringstream ss;

      // modify vector by moves -> convert to 'state' -> save state and cost
      tr (pair_moves, it) {
        int t1 = it->first, t2 = it->second;
        //int popped = newCurr->at(t1).back();
        
        /*
        ss << t1 << t2 << popped;

        if (present (movesDone, ss.str()))
          continue;
        */

        vvi *newCurr = new vvi (*curr);
        newCurr->at(t2).push_back (newCurr->at(t1).back());
        newCurr->at(t1).pop_back();

        if (present (cost, get_state (*newCurr)))   // already seen that state
          continue;

        cost[get_state (*newCurr)] = curr_cost+1;
        Q.push (newCurr);
      }
    }
  }   // while

  fcost = cost[get_state(term)];
  cout << "\n loop fcost " << fcost;

//#endif
}

vii possible_moves (const vvi& front, const int& k) {
  // first vec is empty
  int tower1=1, tower2=1;
  vii ret;

  for ( tower1=1; tower1 <= k; tower1++) {
    for ( tower2=tower1+1; tower2 <= k; tower2++) {
      if (sz(front[tower1]) == 0 && sz(front[tower2])== 0)
        continue;
      else if (sz(front[tower1]) == 0)
        ret.pb (make_pair (tower2, tower1));    // src to dest
      else if (sz(front[tower2]) == 0)
        ret.pb (make_pair (tower1, tower2));
      else {
        int top1 = front[tower1].back();
        int top2 = front[tower2].back();
        (top1 > top2) ? ret.pb (make_pair (tower2, tower1)) : ret.pb (make_pair (tower1, tower2));
      }
    }
  }
  return ret;
}

string get_state (const vvi &vec) {
  std::stringstream ss;
  string s;
  char first='a';
  int cnt=0;

  tr (vec, it) {
    //if (sz(*it) == 0)
    //  continue;
    ss << char (first+ (cnt++));
    tr (*it, itt) {
      ss << *itt;
    }
  }

  return ss.str();
}

void make_state (vvi &tempSorted, int k, string tmp) {
  vs vec;
  getTokens (tmp, vec);
  cout << "\n tmp vec split " ;

  tr (vec, it) {
    cout << "\n \t " << *it;
  }

  int ith=1;
  tr (vec, it) {
    int pegno = (*it)[0] - char ('0');
    tempSorted[pegno].pb (ith);
    ith++;
  }

  tr (tempSorted, it) {
    sort(all(*it), std::greater<int>());
  }
}

void getTokens (string input, vs &tokens) {
  istringstream iss(input);
  copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter<vector<string> >(tokens));
}



# if linux

#include "topcoder_header.h"
//#include "sstream"

/*
   Sample Input #01:

   6 4
   4 2 4 3 1 1
   1 1 1 1 1 1

*/

#define FLU cout.flush ();return ;
typedef vector< ii > vii;

void make_state (vvi &tempSorted, int k, string tmp);
vii possible_moves (const vvi& front, const int& k);
string get_state (const vvi &vec);
void bfs (const vvi &, const vvi &);

int main () {
  int n,k;
  string start, end, tmp;
  char line[1024]={'\0'};
  vvi vec;

  cin >> n >> k;

  vvi init(k+1, vi(0)), term(k+1, vi(0));   // kpegs   , ints sorted front to top

  cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(init, k, tmp);

  //cout << "\n mid ";

  tmp="";
  //cin.ignore();
  getline (cin, tmp);
  //cout << "\n tmp = ["<<tmp<<"]";
  make_state(term, k, tmp);

#if test
  // test init state
  tr (init, it) {
    printVector (*it);
    cout << "\n -- \n";
  }
  tr (term, it) {
    printVector (*it);
    cout << "\n ** \n";
  }
#endif

    //cout << "\n init state " << get_state (init);
    //cout << "\n term state " << get_state (term);

    //test possible moves
    vii moves = possible_moves (init, k);
    tr (moves, it) {
      cout << "\n Peg " <<it->first << " to Peg " << it->second;
    }

    //bfs (init, term, k);
  return 0;
}

void bfs ( const vvi &init, const vvi &term, int k) {
  map <string, int> cost;
  queue <vvi*> Q;
  string term_state = get_state(term);
  string init_state = get_state(init);
  int fcost=-1; //final cost

  if (term_state == init_state) {
    cout << "\n fcost = 0";
    return;
  }

  //base
  cost[get_state(init)] = 0;
  Q.push (&init);

  while (1) {
    if (sz(Q) == 0)
      break;

    vvi *front = Q.front();
    Q.pop();

    string front_state = get_state(front);

    if (front_state == term_state) {
      fcost = cost[front_state];
    }
    else {
      vii pair_moves = possible_moves (front, k);
    }
  }
}

vii possible_moves (const vvi& front, const int& k) {
  // first vec is empty
  int tower1=1, tower2=1;
  vii ret;

  for ( tower1=1; tower1 <= k; tower1++) {
    for ( tower2=tower1+1; tower2 <= k; tower2++) {
      if (sz(front[tower1]) == 0 && sz(front[tower2])== 0)
        continue;
      else if (sz(tower1) == 0)
        ret.pb (make_pair (tower2, tower1));    // src to dest
      else if (sz(tower2) == 0)
        ret.pb (make_pair (tower1, tower2));
      else {
        int top1 = front[tower1].back();
        int top2 = front[tower2].back();
        (top1 > top2) ? ret.pb (make_pair (tower2, tower1)) : ret.pb (make_pair (tower1, tower2));
      }
    }
  }
  return ret;
}


string get_state (const vvi &vec) {
  stringstream ss;
  string s;
  char first='a';
  int cnt=0;

  tr (vec, it) {
    if (sz(*it) == 0)
      continue;
    ss << char (first+ (cnt++));
    tr (*it, itt) {
      ss << *itt;
    }
  }

  return ss.str();
}

//void bf(
void make_state (vvi &tempSorted, int k, string tmp) {
  vs vec;
  getTokens (tmp, vec);
  cout << "\n tmp vec split " ;

  tr (vec, it) {
    cout << "\n \t " << *it;
  }

  int ith=1;
  tr (vec, it) {
    int pegno = (*it)[0] - char ('0');
    tempSorted[pegno].pb (ith);
    ith++;
  }

  tr (tempSorted, it) {
    sort(all(*it), std::greater<int>());
  }
}

#endif
