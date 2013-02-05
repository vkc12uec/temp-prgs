
#include <stdio.h>

#define red   "\033[0;31m"        /* 0 -> normal ;  31 -> red */
#define cyan  "\033[1;36m"        /* 1 -> bold ;  36 -> cyan */
#define green "\033[4;32m"        /* 4 -> underline ;  32 -> green */
#define blue  "\033[9;34m"        /* 9 -> strike ;  34 -> blue */

#define black  "\033[0;30m"
#define brown  "\033[0;33m"
#define magenta  "\033[0;35m"
#define gray  "\033[0;37m"

#define none   "\033[0m"        /* to flush the previous property */

#define ERR(x) printf("\n%s"#x"%s", red, none)
#define WARN(x) printf("\n%s"#x"%s", magenta, none)
#define DEBUG(x) printf("\n%s"#x"%s", cyan, none)
#define FLUSH printf("\n", none)

#define GRN(x) printf("\n%s"#x, green)
#define BRW(x) printf("\n%s"#x, brown)
#define MAG(x) printf("\n%s"#x, magenta)
#define GRAY(x) printf("\n%s"#x, gray)

#if 0
int
main(void)
{
/*
 printf("%sHello, %sworld!%s\n", red, blue, none);
 printf("%sHello%s, %sworld!\n", green, none, cyan);
 printf("%s", none);
 ERR("is my err red");
 WARN("is my warning blue");
 DEBUG("is my debug cyan");
  printf ("\n hellow world");
 WARN("is my warning blue");
 DEBUG("is my debug cyan");
 DEBUG("is my debug cyan");
 GRN("is my debug green");
 BRW("is my debug brown");
 MAG("is my debug magenta");
 GRAY("is my debug gray");
*/

 return 0;
}
