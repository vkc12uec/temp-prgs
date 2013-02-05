
/*
this code makes a struct and copy to char buf, then recopied to an exmpty struct
*/
#include<stdio.h>

typedef struct hdr {
  int seq;
  int flag;
}HDR;

int main (){
  HDR *h1 = (HDR*) malloc (sizeof (HDR));
  h1->seq = 5;
  h1->flag = 50;
  char buf[sizeof (HDR)];
  memcpy (buf, h1, sizeof h1);
  HDR h2;
  memcpy (&h2, buf, sizeof buf);

  printf ("\nh2: sqe = %d, flag = %d", h2.seq, h2.flag);
  return 0;
}
