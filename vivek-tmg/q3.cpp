

#include <iostream>
using namespace std;

/*
 * beam = XY
 * wall = AB
 *
 * Dot product = 0
 */


typedef struct cood {
  int x;
  int y;
} point;

bool perpendi (point b, point w) {
  if (b.x*w.x + b.y*w.y == 0)
    return true;
  else
    return false;
}

int main () {
  // pair up GPS points and use perpndi fn.
  
  point beam1, beam2;
  point wall1, wall2;

  beam1.x=1, beam1.y=1;
  beam2.x=2, beam2.y=2;

  wall1.x = 1, wall1.y=2;
  wall2.x = 2, wall2.y=1;

  point beam_vec, wall_vec;
  beam_vec.x = beam1.x-beam2.x;
  beam_vec.y = beam1.y-beam2.y;

  wall_vec.x = wall1.x-wall2.x;
  wall_vec.y = wall1.y-wall2.y;

  if ( perpendi (beam_vec, wall_vec) ) 
  {
    cout << "\n Lines perpendicular ";
  }
  else {
    cout << "\n Lines NOT perpendicular ";
  }

  return 0;

}
