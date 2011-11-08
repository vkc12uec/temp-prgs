#include<stdio.h>

char *mystrstr (const char *str, const char *p ) {
  if (*p == 0)
    return str;

    int matchedChars = 0; 
    char *s = str;
    char *pat = p;

    while (*s != '\0') {
      if (*s == *p) {
        printf ("\n match at %c", *s);
        matchedChars = 0;
        char *c1 = s;
        char *c2 = p;
        while (*c1 == *c2) {
          matchedChars++;
          c1++,c2++;
          printf ("\n c1 = %c , c2 = %c ", *c1, *c2);
          if (*c1 == '\0' || *c2 == '\0')
            break;
        }
        printf ("\n[%d || %d" ,matchedChars, strlen (p));
        if (matchedChars == strlen (p))
          return s;
      }

      s++;
    }   // while
  #if 0
    while (*str != 0) {
      if (*str == *p) {
        matchedChars = 1;
        char *c1 = str+1;
        char *c2 = p+1;
        printf ("\nmatched = [%s], [%s], [%d]", str, c1, c2);
        while ( (*c1++ == *c2++) && *c1 && *c2)
          matchedChars++;

        printf ("\nmatched = [%s], [%s], [%d]", str, c1, c2);
        //printf ("\nmatched = [%s], [%s], [%d]", str, p, matchedChars);
        if (matchedChars == strlen (p))
          return str;
      }
      str++;
    } // while
  }
  #endif
  return 0;
}

int main () {
  char str[10], p[10];
//  strcpy(str, "vivek");
 // strcpy(p, "ve");
  //printf ("\n[%s]", mystrstr(str, p));

  printf ("\n[%s]", "second");
  strcpy(str, "alphbet");
  strcpy(p, "alphbet");
  str[7]=0;
  p[7]=0;
  printf ("\n[%s]", mystrstr(str, p));

#if 0
  char *s = "hello", *pat = "beta";
  printf ("\n[%s]", mystrstr(s, pat));  //"hello", "beta"));
  s = "hello", *pat = "hello";
  printf ("\n[%s]", mystrstr(s, pat));  //"hello", "beta"));
  //printf ("\n[%s]", mystrstr("hello", "hello"));
  printf ("\n[%s]", mystrstr("hello", '\0');
  #endif
  return 0;
}
