

/* if packet is of size 100, header is of size 50, then
 casting the values as below is working as of now
 */

#include<stdio.h>

typedef struct sctpheader {
  short v;
  char na[10];
} sctpheader_t;

void assign (char *packet);

int main () {
  char packet[sizeof(sctpheader_t)+sizeof(int)];
  sctpheader_t *p=NULL;

  assign(packet);
  p = (sctpheader_t *)packet;

  printf ("\n value = %d, name = %s", p->v, p->na);
  return 0;
}

void assign (char *packet){
  sctpheader_t *p;
  p = (sctpheader_t *)packet;
  p->v = 15;
  strcpy (p->na, "vkc");
  return;
}
