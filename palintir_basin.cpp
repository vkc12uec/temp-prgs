
// Palintir_Rain.cpp : Defines the entry point for the console application.
//
#include <iostream>
#include <string>
#include <stdio.h>
#include <sstream>
#include <vector>
#include <set>
#include <map>
#include <algorithm>
#include <stdlib.h>
#include <iterator>
#include <stack>
#include <queue>

using namespace std;

typedef vector<int> vi; 
typedef vector<string> vs; 
typedef vector<vi> vvi; 
typedef pair<int,int> ii; 
typedef vector < ii > vii;

#define sz(a) int((a).size()) 
#define pb push_back 
#define all(c) (c).begin(),(c).end() 
#define tr(c,i) for( typeof((c).begin()) i = (c).begin(); i != (c).end(); i++ )
#define present(c,x) ((c).find(x) != (c).end())  // map | set
#define cpresent(c,x) (find(all(c),x) != (c).end())  // vector

class Point {
public:
  int x;
  int y;
  Point (int xx, int yy) : x(xx), y(yy) { }

  Point& operator+ (Point &p) {
    x += p.x;
    y += p.y;
    return *this;
  }

  void add (const Point &p1, const Point &p2) {
    x = p1.x + p2.x;
    y = p1.y + p2.y;
  }

  bool operator== (Point &p) {
    return (x == p.x && y == p.y);
  }
  bool isGrteq (Point &p, int **a) {
    return (a[x][y] >= a[p.x][p.y]);
  }
  bool isLessthan (Point &p, int **a) {
    return (a[x][y] <= a[p.x][p.y]);
  }
};

Point options[] = {Point(-1,0), Point(0,1), Point(1,0), Point(0,-1)};
vector<Point> ops (&options[0], &options[0]+4);

template <typename T>
void printVector (vector <T> lis) {
  ostream_iterator<int> oit(cout, " ");
  copy(lis.begin(), lis.end(), oit);
}

bool lowest_nbr (Point nbr, Point &src, int **a) {
  // lowest nbr of 'nbr' is 'src'
  if (a[nbr.x][nbr.y] == INT_MAX)
    return false;

  Point ctmp(0,0);
  int gmin = INT_MAX;
  vector<Point> myops;

  //for (vector<int>::iterator it = ops.begin(); it < ops.end(); it++) {
  tr (ops, it) {
    Point tmp(0,0);
    tmp.add (nbr, *it);
    myops.pb (tmp);
  }

  //for (vector<int>::iterator it = ops.begin(); it < ops.end(); it++) {
  tr (myops, it) {
    if (it->isGrteq(src, a) == false)
      return false;
  }

  return true;
}

/* start from each sink and move to prospective node
prospective node is the one whose flow will be towards the 'sink' */
int _bfs (const vii &sinks, int **a, int left, int right, int n2) {
  int ret=0;
  vi nbasins;
  vector < vector<bool> > visited (n2, vector<bool>  (n2, false));

  // boundry
  for (int i=0; i<n2;i++) {
    visited[0][i] = true;
    visited[n2-1][i] = true;
    visited[i][0] = true;
    visited[i][n2-1] = true;
  }

  tr (sinks, it) {
    visited[it->first][it->second] = true;
  }

  tr (sinks, it) {
    int sinkx = it->first;
    int sinky = it->second;
    //vector<Point> temp;
    // check nbrhood of this sink
    std::queue <Point> basin;
    Point src (sinkx, sinky);
    ret = 1;

    // 1 check  n e w s and if node is okay , push in queue & incr the counter
    while (1) {
      for (int op=0; op < 4; op++) {
        Point curr(0,0);
        curr.add (src,options[op]);

        if (visited[curr.x][curr.y] == true || (curr.isLessthan (src, a) == true) )
          continue;

        if (lowest_nbr (curr, src, a)) {
          basin.push (curr);
          ret++;
          //temp.pb (curr);
          visited[curr.x][curr.y] = true;
        }
      } // 4 directtions

      if (basin.empty())
        break;
      else {
        src = basin.front();
        basin.pop();
      }
    } // while

    //cout << "\n for sink [][] " << sinkx << "|" << sinky << " count = " << ret;
    nbasins.pb (ret);
    //temp.clear();
  } // all sink centers

  sort (all(nbasins), std::greater<int>());
  cout << "\n";
  printVector (nbasins);
  return ret;
}

void bfs (int **a, int n) {
  // first find sinks
  vii sinks;
  int **aa=new int* [n+2];
  int i,j;

  for (i=0; i<n+2;i++)
    aa[i] = new int[n+2];

  // set bounrdy by max
  for (i=0; i<n+2; i++) {
    aa[0][i] = INT_MAX;
    aa[n+1][i] = INT_MAX;
    aa[i][0] = INT_MAX;
    aa[i][n+1] = INT_MAX;
  }

  // assign from old to new
  for (i=0; i<n; i++)
    for (j=0;j<n;j++)
      aa[i+1][j+1] = a[i][j];

  for (i=1; i<=n; i++) {
    for (j=1; j<=n; j++) {
      int center = aa[i][j];
      if (center < aa[i-1][j] && center < aa[i][j+1] && center < aa[i+1][j] && center < aa[i][j-1])
        sinks.pb (make_pair(i,j));
    }
  }

  //cout << "\n no. of basins = "<< 
  _bfs (sinks, aa, 1, n, n+2);

  return;
}

vector <int> getNos (string line) {
  stringstream ss;
  string s;
  vector <int> ret;

  ss << line;

  while (ss>>s) {
    ret.pb (atoi (s.c_str()));
  }

  return ret;
}

#if windows
void test_auto() {
  vector<int> vec;

  vec.pb (1);
  vec.pb (2);
  vec.pb (3);

  //#define tr1 (c,i) for (auto i=(c).begin(); i!=(c).end; i++)

  for(auto it=vec.begin(); it < vec.end(); it++)
    cout << "\n -- " << *it;

  //tr1 (vec,it) {
  //cout << "\n -- " << *it;
  }

  int i;
  exit(-1);
}
#endif

int main()
{
  //test_auto();

  int n,cn;
  string line;

  cin >> n;
  cn = n;

  int **a = new int *[n];
  for (int i=0; i<n; i++)
    a[i] = new int [n];

  vector < vector<int> > matrix;  // (n, vector<int> (n, 0));
  cin.ignore();

  while (getline (cin, line)) {
    matrix.push_back (getNos (line));
    if (--cn == 0)
      break;
  }

  for (int i=0; i<n; i++)
    for (int j=0; j<n; j++)
      a[i][j] = matrix[i][j];

  bfs(a, n);
  //cin.get();
  cout.flush();
  return 0;
}
