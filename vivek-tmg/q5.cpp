/*
 * Q: The Prince’s location is marked with '1', the Princess’s location is marked with '2'. ‘.’ - marks a free spot and ‘o’ marks a column. 
 *
 * Algo: use BFS to find the shortest path. Keep incrementing nbr cells value until u reach princess
 *
 * Notation:
 *
 *  0 => free spot
 *  -1 => blocked
 * 
 */

#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;

typedef struct COOD {
  int x;
  int y;
  int z;
} point ;

bool sameLocation (point &p1, point &p2);
bool moveNbr (point &curr, int option);

int main () {

  int a[3][3][3] = {
    {
      {1, 0, 0 },
      {-1, -1, 0 },
      { 0, 0, 0}
    },
    {
      {-1,-1,-1 },
      {0, 0, -1 },
      {0, -1, -1 }
    },
    {
      {-1, -1, -1 },
      { -1, 0, 0},
      { -1, 0, 0}
    },

  };

  // using BFS
  queue <point> Q;
  point start, end, curr, nbr, savcurr;
  int hops=0;

  start.x = 0, start.y = 0,   start.z = 0;
  curr.x = 0, curr.y = 0,   curr.z = 0;
  end.x = 2, end.y = 2,   end.z = 2;

  while (1) {

    if ( sameLocation(curr, end) )    //GOT princess
      break;

    hops = a[curr.x][curr.y][curr.z];

    for (int option = 1; option <= 5; option++)  
    {
      savcurr=curr;   // save curr location

      if ( ! moveNbr (curr, option) )
        continue; 
      else {
        nbr = curr;
        curr = savcurr;
      }

      if ( a[nbr.x][nbr.y][nbr.z] == 0 ) {
        a[nbr.x][nbr.y][nbr.z] = hops+1;

        if ( sameLocation(nbr, end) )
          break;

        Q.push (nbr);
      }

    } // for ()       // 5 direction

    if (Q.empty() == true) {
      break;
    }

    curr = Q.front();
    Q.pop();

  } //while

  int totalHops = (a[end.x][end.y][end.z] - a[start.x][start.y][start.z]);
  int totalTime = 5*totalHops;

  cout << "\n Hops = " << totalHops << " Time taken = " << totalTime;

  return 0;
}

bool sameLocation (point &p1, point &p2) {
  bool ret;
  ret = (p1.x == p2.x && p1.y == p2.y && p1.z == p2.z) ? true : false;
  return ret;
}

bool moveNbr (point &curr, int option) {

  switch (option) {
    case 1:   //north
      if ( curr.y == 0)
        return false;
      else
        curr.y -= 1;
      break;
    case 2:   //east
      if ( curr.z == 2)
        return false;
      else
        curr.z += 1;
      break;
    case 3:   //west
      if ( curr.y == 2)
        return false;
      else
        curr.y += 1;
      break;
    case 4:   //south
      if ( curr.z == 0)
        return false;
      else
        curr.z -= 1;
      break;
    case 5:   //down
      if ( curr.x == 2)
        return false;
      else
        curr.x += 1;
      break;
  }

  return true;
}

