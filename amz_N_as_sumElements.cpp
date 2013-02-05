/*
http://www.careercup.com/question?id=14947116

17 Answers
amazon

Given an integer (assume it's smaller than 50), write an algorithm that will generate all possible combinations of integers greater than 1 and they produce a sum equals to this number. The same number can appear more than once in a combination. What's the time complexity of your algorithm?

For example: 
<=1 -> {}
2 -> {2}, 
3->{3}, 
4->{[4], [2, 2]}, 
5->{[5], [3, 2]}, 
6->{[6], [4, 2], [3, 3], [2, 2, 2]} 
7->{[7], [5, 2], [4, 3], [3, 2, 2]}
8->{[8], [6, 2], [5, 3], [4, 4], [4, 2, 2], [3, 3, 2], [2, 2, 2, 2]}
*/

/*

space : 2 .... N-1

base element will be fill[0], increases from 2 , 3, 4, ...
Algo:
*/

#include "topcoder_header.h"


void debug (int i) {
  cout << "\n - " << i;
}

void print_arr (int *n, int len) {
  printf ("\n");
  for(int i=0;i<len;i++)
    printf (" -- %d", n[i] );
}

void keepsum (int rem, int *sample, int slen, int *fill, int fillptr, int base) {
  if (rem == 0) {
    cout << " \ndisplay fill [] ";
    print_arr (fill, fillptr);
    return ;    // dont take next increasing elements
  }

  for (int sid=base; sid < slen; sid++)
    if ( rem - sample[sid] >= 0) {
      fill[fillptr] = sample[sid];
      keepsum (rem - sample[sid], sample, slen, fill, fillptr+1, sid);

      /*
         keepsum (rem - sample[sid], sample, slen, fill, fillptr+1, base);   

         1st ateempt was passing the 'base' but that also included pairs like 2,2,4 and 2,4,2 which are same. Hence we want increasing elements in sub pairs
         Hence pass the 'sid' in place of 'base'
         */
    }
}

#if old 
bool keepsum (int rem, int *sample, int slen, int *fill, int fillptr, int base) {
  if (rem == 0) {
    cout << " \ndisplay fill [] ";
    return true;
  }

  for (int sid=base; sid < slen; sid++)
    if ( rem - sample[sid] >= 0) {
      rem -= sample[sid];
      fill[fillptr] = sample[sid];
      if (keepsum (rem, sample, slen, fill, fillptr+1, base)) {
        print_arr (fill, fillptr);
        break;  // next sample[sid] has value greater
      }
    }

  //return false;
}
#endif

#if 0
void printCombBase (int rem , vs &sample, int base, int fill[], int fillptr, int filllen) {

  //void printCombBase (int rem , vi &sample, int base, vi &vfill) {
  if (rem == 0) {
    for_each (all(vfill), debug);
  }

  tr(sample, it) {

  }
}

void printComb (int n, vi sample) {
  int fill[8];
  int fillptr = 0;
  int filllen = 8;
  vi vfill;

  tr (sample, it) {
    //printCombBase (n , sample, *it, vfill);  //, fillptr, filllen);
    printCombBase (n , sample, *it, fill, fillptr, filllen);
  }
}

int main () {
  int n = 8;
  vi sample;

  for (int i=2; i< n; i++)
    sample.pb(i);

  printComb (n, sample);
  return 0;
}

#endif

int main () {
  const int N=8;
  int sample[N-1];
  int c=2;

  for (int i=0; i<N-1; i++, c++)
    sample[i] = c;

  //for (int i=0; i<N-1; i++, c++)
  //debug (sample[i]);

  int fill[N-1]={0}, fillptr=0, base=0;

  keepsum (N, sample, N-1, fill, fillptr, base);

  //bool keepsum (int rem, int *sample, int slen, int *fill, int fillptr, int base) {

  return 0;
}

// code taken from subset_sum*.cpp  #wrong_algo
/* if u make a sample with duplicate , subset_sum code will give u duplicate answers becoz of 
   2204 and 2024  => which essentialy is {224} only

   hence it has to be a new algo for this problem
   */

#if wrong_algo
int N = 8;
vi sample;

// make sample[] with dup elemnts
for (int d=2; d<=8; d++) {
  for (int t=0; t< int(N/d); t++)
    sample.pb (d);
}

//for_each (all(sample), debug);

int len = sample.size();
int isample[len];
int ind=0;

tr (sample, it) {
  isample[ind++] = *it;
}

//for (ind=0; ind<len; ind++)
//debug (isample[ind]);

int fill[len];
int fillptr=0;

for (int i=0;i<len;i++)
fill[i] = 0;

print_combi (isample, 0, len, N, fill, fillptr);
return 0;
}

int print_combi (int a[], int start, int alen, int val, int fill[], int fillptr ) {
  // base condi.
  if (val == 0) {
    printf ("\n WOW val = 0");
    return 1;
  }
  else if (start == (alen)) {
    return -1;
    // cant achieve the sum
  }

  // take the option
  fill[fillptr] = a[start];
  int ret = print_combi (a, start + 1, alen, val - a[start], fill, fillptr+1);
  if (ret == 1)
    print_arr (fill, alen);

  // dont take that option
  fill[fillptr] = 0;
  ret = print_combi (a, start + 1, alen, val, fill, fillptr+1);
  if (ret == 1)
    print_arr (fill, alen);

  return 0;	// is thi condi. useful ?
}

#endif
