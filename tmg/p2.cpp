

#include <iostream>
using namespace std;

int main () {
  int places[] = {0, 0, 0, 0, 0, 0};
  int one, two, three, four, five, six;
  int lsum, rsum;
  int size = 6;

  one = 0;
  two = 0;
  three = 0;
  four = 0;
  five = 0;
  six = 0;

  int total_lucky=0;
  int comp=0;

  for (one = 0;one <= 9; one++) {
    for (two = 0;two <= 9; two++) {
      for (three = 0;three <= 9; three++) {
        for (four = 0;four <= 9; four++) {
          for (five=0;five <= 9; five++) {
            for (six=0;six <= 9; six++) {

              lsum = six+five+four;
              rsum = one+two+three;
              comp++;

              //cout << "\n" << one << " " << two << " "<< three << " " << four << " " << five << " " << six;

              if (lsum == rsum) 
                total_lucky += 1;
            }
          }
        }
      }
    }
  }

  cout << "\nTotal # of lucky = " << total_lucky << " comp = " << comp;
  return 0;
}
