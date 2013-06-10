
#include "topcoder_header.h"

/* even on left, odd on right */

void Swap (int a[], int p1, int p2) {
  int t = a[p1];
  a[p1] = a[p2];
  a[p2] = t;
}

#if 0
+-files/
+-target/
| +-file1.xml
| +-file2.jar
| +-file3.txt
| +-classes/
|   +-src/
|   | +-Delete.java
|   | +-DeleteTest.java
|   | +-pom.xml
|   +-usr/
|     +-bin/
|     | +-cat.exe
|     +-blah.jpg
+-build.xml
#endif

void Print (string path) {
  _print (path, 0, "");
}

void blanks (int c) {
  cout << "\n";
  while (c--)
    cout << " ";
}

void _print (string path, int space, string prefix) {
  blanks(space);
  cout << "+" << prefix << path;
  cout << "\n";

  vector<string> list = GetFiles(path);

  tr (list, it) {
    if (IsDirectory(*it)) {
      _print ();
    }
    else {
      blanks(space+1);
      cout << "+" << prefix << *it;
      cout << "\n";
    }
  }
}

bool isEven (int x) {
  if (x & 1 == 0)
    return true;
  else
    return false;
}

void even_odd (int a[], int lo, int hi) {
  // even to left
  // left odd ptr, right even ptr
  int p1=0, p2 = hi;

  while (1) {
    while (isEven (a[p1]))
      ++p1;

    while (!isEven(a[p2]))
      --p2;

    if (p1 > p2)
      break;

    Swap (a, p1, p2);
  }
}

int main () {
  int a[] = {1, 1, 5, 2, 7, 7 };
  //int a[] = {1, 2, 3, 4, 5, 6, 7, 8};
  int len = SizeOfArray(a);

#if testWhile
  int a[] {1,2,3,4,5,6}
  len = 6;
  even_odd (a, 0, len-1);
  return 0;
#endif

  int firstodd=0, curr=0;

  while (a[firstodd] % 2 == 0)
    firstodd++;

  cout << "\n firstodd = " << firstodd;

  for (curr=0; curr<len; curr++) {
    if (a[curr] % 2 == 0) {
      Swap (a, firstodd, curr);
      firstodd++;
    }
  }

  for (curr=0; curr<len; curr++)
    cout << "\n\t" << a[curr];

  return 0;
}
