

#include <iostream>
using namespace std;

/*
 * we need 4 points
 * 2 on the beam 
 * 2 on the tower
 *
 * their dot product should be zero
 */

typedef struct mypoint {
  int x;
  int y;
} point;


int main () {
  point p1, p2;
  point p3, p4;

  // assingned
  p1.x = 1, p1.y=2, p2.x=3, p2.y=4;
  p3.x=5, p3.y=6, p4.x=7, p4.y=8;

  if (p1.x - p2.x == 0) // vertical line
    if (p3.y - p4.y == 0 )
      cout << "\ncorrect";
    else
      cout << "\nINcorrect";

  if (p3.x - p4.x == 0) // vertical line
    if (p1.y - p2.y == 0 )
      cout << "\ncorrect";
    else
      cout << "\nINcorrect";

  float m1= (p1.y - p2.y)/(p1.x - p2.x);
  float m2= (p3.y - p4.y)/(p3.x - p4.x);

  if (m1*m2 == -1) 
      cout << "\ncorrect";
    else
      cout << "\nINcorrect";

  return 0;
}
