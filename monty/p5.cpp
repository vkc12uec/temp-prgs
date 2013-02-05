/*
 * The Prince’s location is marked with '1', the Princess’s location is marked with '2'. ‘.’ - marks a free spot and ‘o’ marks a column. 
 * */

#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;

typedef struct mypoint {
  int x;
  int y;
  int z;
} point ;

bool iseq (point &one, point &two) {
  if (
      one.x == two.x &&
      one.y == two.y &&
      one.z == two.z 
     )
    return true;
  else 
    return false;
}

bool new_cood ( point &curr, int option) {
  // N E S W D

  switch (option) {
    case 1:
      if ( curr.y == 0)
        return false;
      else
        curr.y -= 1;
      break;
    case 2:
      if ( curr.z == 2)
        return false;
      else
        curr.z += 1;
      break;
    case 3:
      if ( curr.y == 2)
        return false;
      else
        curr.y += 1;
      break;
    case 4:
      if ( curr.z == 0)
        return false;
      else
        curr.z -= 1;
      break;
    case 5:
      if ( curr.x == 2)
        return false;
      else
        curr.x += 1;
      break;
  }

  return true;
}


int main () {

  // 0 free
  // -1 blocked
  //  1 start 2 end

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
  point start, end, curr, nbr, oldcurr;

  start.x = 0, start.y = 0,   start.z = 0;
  curr.x = 0, curr.y = 0,   curr.z = 0;
  end.x = 2, end.y = 2,   end.z = 2;

  // << "\n" <<a[start.x][start.y][start.z];
  // << "\n" <<a[end.x][end.y][end.z];
  // << "\n" <<a[1][2][0] << " " <<a[1][2][1];  // [end.x][end.y][end.z];

  int old=0;

  while (1) {

    if ( iseq(curr, end) )
      break;

    old = a[curr.x][curr.y][curr.z];
    // << "\n curr = " << curr.x << "|" << curr.y << "|" << curr.z;

    for (int option = 1; option <= 5; option++)  // 5 options    north, east, south, west, down
    {

      oldcurr=curr;
      if ( ! new_cood (curr, option) )
        continue;   // bound
      else {
        nbr = curr;
        curr = oldcurr;
        // << "\n\t move option " << option;
        // << "\n\t\tnew curr = " << nbr.x << "|" << nbr.y << "|" << nbr.z;
      }

      // nbr is move able
      /*
      if ( iseq(nbr, end) ) {
        a[nbr.x][nbr.y][nbr.z] = old+1;
        break;
      }
      */

      if ( a[nbr.x][nbr.y][nbr.z] == 0 ) {    //|| a[nbr.x][nbr.y][nbr.z] == 2 ) {
        a[nbr.x][nbr.y][nbr.z] = old+1;

        if ( iseq(nbr, end) )
          break;

        // << "\n\t\t pushing";
        Q.push (nbr);
      }

      } // for ()

      if (Q.empty() == true) {
       break;
      }

      curr = Q.front();
      Q.pop();
    }   // infinite

    // << "\n result";
    // << "\n" <<a[start.x][start.y][start.z];
    // << "\n" <<a[end.x][end.y][end.z];

    cout << "\n jumps = " <<(a[end.x][end.y][end.z] - a[start.x][start.y][start.z]) << " second = " << 5*(a[end.x][end.y][end.z] - a[start.x][start.y][start.z]);

#if debug
    for (int i=0; i<3; i++) {   // floor #
      for (int j=0; j<3; j++) {
        for (int k=0; k<3; k++)
          cout << " " << a[i][j][k];

        cout << "\n";
      }

      cout << "\n";
    }
#endif


    return 0;
  }
