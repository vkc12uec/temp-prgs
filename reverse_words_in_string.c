/*
  : "reverse_words_in_string.c"
    output:
       reverse = [o ateb si siht]
       answer = [o beta is this] 

*/

void reverse_part (char *a, int lo , int high ) {
  while (lo < high) {
    char c= a[lo];
    a[lo] = a[high];
    a[high] = c;
    lo++;
    high--;
  }
}

main () {
  char str[]= "this is beta o"; // o ateb si siht
  int len = strlen (str);

  // whole reverse
  char *a = str;
  int n = len;
  for (int i=0;i<(n/2);i++) {
    char c = a[i];
    a[i] = a[n-i-1];
    a[n-i-1] = c;
  }
    
  //str[len] = 0;
  printf ("\n reverse = [%s]", str);

  //#if 0
  // do word-wise reverse
  int word_st = 0, word_end = 0, curr = 0;
  int flag = 0;

  while (a[curr] != 0) {
    if (a[curr] == ' ') {
      //word_end = curr-1;
      reverse_part (a, word_st, curr-1);
      flag = 0; // for new word_st
    }
    else {
      if (flag == 0) {
        word_st = curr;
        flag = 1;
      }
      }
      curr++;
  }
  reverse_part (a, word_st, curr-1);

  printf ("\n  answer = [%s] " , str);
  //#endif

}
