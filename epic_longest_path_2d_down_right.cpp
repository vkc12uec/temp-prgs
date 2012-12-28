/*
   3) You are given a 2D grid of integers. You have to find the longest path in the grid such that adjacent terms in the path have a difference of +1/-1. Print all paths of max length.

http://get-that-job-at-google.blogspot.in/2012/12/epic-systems-test.html#comment-form
Constraint : you can move only down and right.
*/

#include "topcoder_header.h"

// mtd 2: just use stack for each i,j

void dfs(r, int  &dfslen) {
  static int len=0;
  len++;
  dfslen = max (len, dfslen);

  if (move down)
    dfs (r->down, dfslen);
  if  (move right)
    dfs (r->right, dfslen);
}

void longest (int a[][10], int len) {
  Stack <point> s;
  int len=INT_MIN;
  
  for (i=0; i<10; i++) {
    for (j=0; j<10; j++) {
      point r(i,j);
      int dfslen=0;
      len = max (dfs (r, dfslen), len);     // cant use visited becoz any intermedite node can participte in 2 long paths, out of which 1 is max.
    }
  }
}

class gNode;

typedef vector<gNode*> vgn;

class gNode {
  public:
    int data;
    int r;
    int c;
    vgn childs;
};

// mtd 1: Make multiple graphs and apply longestPath()
//
void form_graph (int a[][10], int len, may <ii, gNode*> mymap) {
  // but graph can be disconnected , So: we can have a list of graph then to apply longest path in DAG

  vvi visited (10, vi (10, 0));     // 0 means not visited  , 2D matrix , it means that node is already in some graph

  // foreach i,j in matrix
  //  if cell not visited
  //    start making graph from there
  //      insert graph node in list
  //

  for (i=0; i<len; i++) {
    for (j=0; j<len; j++) {
      if (visited[i][j] == true)
        continue;

      gNode *r = mymap[ pair(i,j) ];
      Queue<gNode*> q(0);

      q.push (r);

      while (!q.IsEmpty()) {
        t = q.Delete();

        if (move down using t) {
          gNode *child = mymap[ pair(rr+1,rc) ]
          q.push (child);
          visited[rr+1][rc] = 1;
        }

        if (move right using t) {
          gNode *child = mymap[ pair(rr,rc+1) ]
            q.push (child);
          visited[rr][rc+1] = 1;
        }

      }   // while

      vector <gNode*> list.pb (r);

    }
  }

}

void test_2d_passing (int a[][10], int len) {       // correct way of passing 2d array
  //void test_2d_passing (int **a, int len) {     // NOT
  //void test_2d_passing (int a[][], int len) {     // NOT}
}

void get_map (int a[][10], int len, map<ii, gNode*> mymap) {
  for (i=0; i<10; i++)
    for (j=0; j<10;j++) {
      ii loca(i, j);
      gNode *t = new gNode (a[i][j], i, j);
      mymap[loca]=t;
    }
}


int main() {
  // form a graph, given 2D array;
  gNode root;
  int a[10][10];
  int len=10;

  test_2d_passing (a, len);

  map <ii, gNode*> g_Nodemap;
  get_map(a, len, g_Nodemap);

  form_graph (a, len, g_Nodemap);

  return 0;
}
