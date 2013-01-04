
main () {

int *p = new int a[3];
p[0] = 11;
p[1] = 22;
p[2] = 33;

delete p;
printf ("\n%d", p[1]);
return;

int ii = 0b0111;
int iu = 10;
int& refi = iu;
//&refi = iu;
//&refi = ii;
printf ("\n%d", ii);
return;

int i,j;
j = 10;
i = 3;
i = j++ - j++;
//i = i++ + ++i;
//i = j++ - j++ + i++ + ++i;
printf("%d\n", i);
return;

char c = 'A'; // address of c is 0x1000, Ascii code for .A. is 65
char *p = &c; // address of p is 0x2000
c = *p;
printf ("\n[%c]", c);

char str[] = "abcd";
int n = strlen(str);

for (int i=0;i<=(n/2)-1; i++){
  int p1 = i, p2 = n-1-i;

  char c = str[p1];
printf ("\n[%c]", c);
  str[p1] = str[p2];
  str[p2] = c;
}

printf ("\n[%s]", str);

char achar = 15;
int newchar = 0;
char copy = achar;

while (copy) {
  int lastbit = copy & 1;
  printf ("\n lastbit =[%d]", lastbit);
  newchar = newchar | lastbit;
  copy = copy >> 1;
  newchar = newchar << 1;
}

printf ("\n %d", newchar);


}
