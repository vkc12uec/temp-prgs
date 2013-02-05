
/*pdf
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

Algo:

  best_play_south and best_play_north will internally call play() to play for certain 'choice' and then play will internally call
    best_*() if it lands on own Kalah else do the capture

    best_* () {
      // try land in own mancala
      // else
      // try capture
    }

*/

#include <iostream>
#include <stdlib.h>
using namespace std;

#include <assert.h>
#include <time.h>

#define np 6
#define LEN 14

/*
  ACW

  0 1 2 3 4 5
  n n n n n n
N             S
  s s s s s s
  0 1 2 3 4 5

index            0 1 2 3 4 5 6 7 8 9 0 1 2 3
                 n n n n n n N s s s s s s S
board            5 4 3 2 1 0   0 1 2 3 4 5 
*/

// board no. to index
#define nmap(nchoice) (5-nchoice)
#define smap(schoice) (7+schoice)

// index to board
#define nrev(id) (5-id)
#define srev(id) (id-6-1)

#define smap(schoice) (7+schoice)

#define NKALA 6
#define SKALA 13

void play (int *arr, bool player, int choice);

void print_config (int *arr) {
  //todo
  int i=0;
  cout << "\n\n";

  for (i=0; i<LEN; i++)
    cout << " " << i;

  cout << "\n";

  for (i=0; i<7; i++)
    cout << " "<< 'n';

  for (i=0; i<7; i++)
    cout << " "<< 's';

  cout << "\n";

  for (i=0; i<LEN; i++)
    cout << " " << arr[i];

  cout << "\n";
}

bool detect_game_end (int *arr) {
  // by summing the board values if == 0

  int i, s=0;

  for (i=0; i<=5; i++)
    s += arr[i];

  if (s==0) return true;

  s=0;
  for (i=7; i<=12; i++)
    s += arr[i];

  if (s==0) return true;

  return false;
}

// capture opposite of 'lid'
void capture (int *arr, int lid, bool player) {
  //cout << "\nfn: capture : player " << player;
  int oppid = (player) ? 6+(6-lid) : (13+13-lid)%LEN;
  int MYKALA = (player) ? NKALA : SKALA;

  int incr = arr[lid] + arr[oppid];
  arr[lid]=0;
  arr[oppid]=0;

  arr[MYKALA] += incr;
}

int get_next_non_forbid (int sid, int forbid) {
  sid = (sid+1)%LEN;
  if (sid == forbid)
    sid = (sid+1)%LEN;
  else
    return sid;
}

bool lidInCorrectRange (int lid, bool player) {
  if (player) {
    if (lid >= 0 && lid <= 5)
      return true;
    else 
      return false;
  }
  else {
    if (lid >= 7 && lid <= 12)
      return true;
    else 
      return false;
  }
}

// option 1: again end in kalah
// option 2: do capture

void best_play_north (int *arr) {
  bool poss = false, poss1=false;
  //  cout << "\nfn: best_play_north : ";

  //option 1:
  int i=5;
  for (i=5; i>=0; i--) {
    if (arr[i] == (NKALA-i+1)) {
      poss=true;
      break;
    }
  }

  if (i>=0) {   // i is index of arr
    assert (poss);
    play (arr, true, nrev(i));
  }
  else {
    // option 2: try capture
    for (i=0; i<=5; i++) {
      int hoppedid = i+arr[i]-1;
      if (arr[hoppedid] = 0) {
        //play and capture from (i)
        play(arr, true, nrev(hoppedid));    // this will result in capture
        poss1=true;
        break;
      }
    }
  }

  if (poss == false && poss1 == false) {
    // chose any random
    for (i=0; i<=5; i++)
      if (arr[i] != 0) {
        play (arr, true, nrev(i));
        return;
      }
  }
}

void best_play_south (int *arr) {
  bool poss = false, poss1=false;
  //cout << "\nfn: best_play_south : ";

  //option 1:
  int i=7;
  for (i=7; i<=12; i++) {
    if (arr[i] == (SKALA-i+1)) {
      poss=true;
      break;
    }
  }

  if (i<=12) {   // i is index of arr
    assert (poss);
    play (arr, false, srev(i));
  }
  else {
    // option 2: try capture
    for (i=7; i<=12; i++) {
      int hoppedid = i+arr[i]-1;
      if (arr[hoppedid] = 0) {
        //play and capture from (i)
        play(arr, false, srev(hoppedid));    // this will result in capture
        poss1=true;
        break;
      }
    }
  }

  if (poss == false && poss1 == false) {
    // chose any random
    for (i=7; i<=12; i++)
      if (arr[i] != 0) {
        play (arr, false, srev(i));
        break;
      }
  }

  //print_config(arr);
}

void best_play (int *arr, bool player) {
  //cout << "\nfn: best_play  :  player " << player;

  if (player)
    best_play_north(arr);
  else
    best_play_south(arr);
}

void play (int *arr, bool player, int choice) {
  /* true = north
   * false = south
   */
  //cout << "\nfn: play : player " << player<< " choice " << choice;
  int forbid, lid, sid, nseeds=0, MYKALA;

  sid = (player) ? nmap(choice) : smap(choice);
  forbid = (player) ? SKALA : NKALA;
  MYKALA = (player) ? NKALA : SKALA;

  nseeds = arr[sid];
  arr[sid]=0;
  lid=-1;   // last id

  while (nseeds) {
    arr[sid] += 1;
    --nseeds;
    lid = sid;
    sid = get_next_non_forbid (sid, forbid);
  }

  //cout << "\nafter play() ---- mid ----  \n";
  //print_config(arr);

  assert (lid >= 0);

  if (lid == MYKALA)
    best_play (arr, player);
  else {
    // check if capture
    if (arr[lid] == 1 && lidInCorrectRange (lid, player) ) {
      capture(arr, lid, player);
    }
  }
}

int get_rand (int range) {
  srand ( time(NULL) );
  return (rand() % range);
  //v1 = rand() % 100;         // v1 in the range 0 to 99
}

void init (int *a) {
  int N=30,i=0, s=0;

  // 0-5
  // 7-12
  for (i=0; i<=4; i++) {
    a[i] = get_rand (N);
    cout << "\nai = "<<a[i];
    N -= a[i];
    s += a[i];
  }
  a[5] = 30 - s;

  N=30, i=0, s=0;

  for (i=7; i<=11; i++) {
    a[i] = get_rand (N);
    cout << "\nai = "<<a[i];
    N -= a[i];
    s += a[i];
  }
  a[12] = 30 - s;
}

int main () {
  int arr[2*np + 2];

  init(arr);
  //print_config(arr);
  arr[NKALA] = arr[SKALA] = 0;

  /*
     ask north player which pit he has to choose ?
     then you play the south side
     */
  int nchoice, schoice, nid, sid;

  while (1) {
    // print config
    print_config(arr);

    cout << "\n North player: which pit you choose ? ";
    cin >> nchoice;

    // north
    // assert (arr[nchoice] > 0);
    play(arr, true, nchoice);

    cout << "\nafter north played, config \n";
    print_config(arr);

    // south player loop
    cout << "\n South playing";
    best_play_south (arr);

    if (detect_game_end(arr)) {
      print_config(arr);
      break;
    }

  } // game loop
  return 0;
}

