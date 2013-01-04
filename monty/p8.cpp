#include "topcoder_header.h"

/*
   This is the result of Table 12 of Kalah is obtained using C++ program on Linux
   machine. The moves of the players are shown in Table 13.The strategy involved is basically
   to move the seed or seeds from the pit in which the last seed will land in the Kalaha whenever
   possible. When the move to have the last seed lands in the Kalaha is not possible, the player
   then attempts to capture. The strategy was assumed to be applicable to both players of Kalah.
   [The explanation for the numbering of the pits and symbols are provided in Section 11]


   Write a program that can play the game of Kalah (http://en.wikipedia.org/wiki/Kalah) against a human opponent. The initial number of seeds is 30 for each player but they are allocated into houses randomly. Use Console to communicate board & moves.

   N N N N N N 
 N              S
   S S S S S S
*/

#include <time.h>
#define NP  6

int get_rand () {
  srand(time(NULL));
  return rand() % 30 + 1;
}

bool canFinishat (int &id, int *south) {
  for (int i=0; i<NP; i++)
    if (south[i] == (NP+1 - i + 1) )
}

int main () {

  int north[NP+1], south[NP+1];
  int left = 0 , right = 0, r;

  int accu=0;

  for (int i=0; i < NP; i++) {
    north[i] = 5;
    south[i] = 5;
  }

  north[NP]=south[NP] = 0;

  // ACW movement
  finish = false;

  while (!finish) {
  // p1 south p2 north
  //
  while ( p2moves ) {
    if ( canFinishat (id, south) ) {
    }
  }



  }


}
