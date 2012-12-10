
#include "topcoder_header.h"

#define np 6
#define LEN 14

/*
  ACW

  0 1 2 3 4 5
  n n n n n n
N             S
  s s s s s s
  0 1 2 3 4 5

  0 1 2 3 4 5 6 7 8 9 0 1 2 3
  n n n n n n N s s s s s s S
  5 4 3 2 1 0   0 1 2 3 4 5 
*/

#define nmap(nchoice) (5-nchoice)
#define smap(schoice) (7+schoice)
#define nsmap(nid) (7+schoice)

void play (int *arr, int sid, int ns) {
  int nseeds;

  switch (ns){
    case 0:
      break;

    case 1:
      // south
      assert(sid != 6);

      nseeds = arr[sid];
      arr[sid]=0;

      while (nseeds) {
        arr[sid] += 1;

        sid = (sid + 1) % LEN;
        if (sid == 6) ++sid;

        --nseeds;
      }
      
      break;
  }
}

int main () {
  int north[np], south[np];
  int arr[2*np + 2];
  int kn, ks;

  kn=ks=0;

  for (int i=0; i<(2*np)+2; i++)
    arr[i] = 5;

  arr[6] = arr[13] = 0;

/*
 ask north player which pit he has to choose ?

 then you play the south side
*/
  int nchoice, schoice, nid, sid;

  while (1) {
  // when to exit ?

    cout << "\n North player: which pit you choose ? ";
    cin >> nchoice;
    nid = nmap(nchoice);

    if ( north[nid] == 0 ) {
      cout << "\n its invalid pit, no seeds. Enter again";
      continue;
    }

    // move ACW
    int nseeds = north[nid];
    north[nid] = 0;

  //0 1 2 3 4 5 6 7 8 9 0 1 2 3
  //n n n n n n N s s s s s s S
  //5 4 3 2 1 0   0 1 2 3 4 5 

    while (1) {   //north player loop

      while (nseeds != 0) {
        (nid == 13) ? nid = 0 : nid = (nid+1)%LEN;
        if (nid == 13)
          nid = 0;

        arr[nid] += 1;
        --nseeds;
      }
      
      // nid was the last slot filled

      if (nid == 6) {    // ending in north kalah, play again
        nseeds = arr[6];
        arr[nid] = 0;
        continue;
      }
      else  {
        if (nid >= 7 && nid <= 13)
          cout << ""; //no-op
        else {
        // ending in north region
          if (arr[nid] == 1) {
            // find the south mapping index
            int delta = (6-nid-1);
            int moveseeds = arr[nid] + arr[6+1+delta];
            arr[nid] = 0;
            arr[6] += moveseeds;
          }
        }
        break;    // lose turn
      }
    }   // north player loop

      // south player loop
      /*
      The moves of the players are shown in Table 13.The strategy involved is basically
      to move the seed or seeds from the pit in which the last seed will land in the Kalaha whenever
      possible. When the move to have the last seed lands in the Kalaha is not possible, the player
      then attempts to capture. The strategy was assumed to be applicable to both players of Kalah.
      */
    //0 1 2 3 4 5 6 7 8 9 0 1 2 3
    //n n n n n n N s s s s s s S
    //5 4 3 2 1 0   0 1 2 3 4 5 

    while (1) {
      // can u land in s-kalah
      schoice = -1;
      for (int i=7; i<=12; i++) {
        if (arr[i] == (13-i+1) ) {
          schoice = i;
        }
      }

      if (schoice != -1) {
        nseeds = sarr[schoice];
        arr[schoice] = 0;
        for (; schoice <= 13; schoice++)
          arr[schoice]++;
          
        continue;
      }
      else {
        // chose any pit such that when u start sowing, u end in capture
        int sid=7;
        for (; sid <= 13; sid++) {
          int jump = arr[sid]-1;
          int jumpsid = sid+jump;

          if (jumpsid >13)
            continue;
          else if ( arr[jumpsid] == 0 )
            break;
          }

        if (sid == 14)
          break;    // lose turn or play from random pit
        else 
          play (arr, sid, 1);
        }
      }

    } // game loop


  }

}






}

return 0;
}
