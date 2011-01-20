  #include <stdio.h>
  #define S "Hello, World\n"
  main(){exit(printf(S) == strlen(S) ? 0 : 1);}
