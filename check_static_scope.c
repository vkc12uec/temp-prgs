/*
see if the static var returned from a func. is readable in main or not */

#include<stdio.h>

char *get () {
  char str[] = "the good boy";  // doing this , dosent WORK
  //static char str[] = "the good boy";  // IT works
  static char *c = &str[0];
  return c;
}

int main () {
  char *c = get();
  printf ("\n[%s]", c);
  return 0;
}
