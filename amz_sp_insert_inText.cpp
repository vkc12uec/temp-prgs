/*
   9 Answers
   Given a word and special characters print all the combinations of that word along with atmost 2 special characters
   Word - test
   special characters 0-9,%,#,&,!
Eg: test, test1, test2, te3st, te1!st, test#%, 12test, !te5st, t0est&, etc. etc.
*/

/*
   sp[] = charof special charac  => apply docombine() =>: save combinations in csp[]

Algo:

foreach string s in csp[]
  interpolate ( s , len (s) , text)

  if len == 1 "simple"
  len == 2 "insert 1st char , save in vec , insert 2nd char"

writing interpolate is IMP
*/

#include "topcoder_header.h"

void debug (string s) {
  cout << "\n " << s;
}

void interpol (char *sp, int len, char *t) {

  vector<string> combs;
  string st = string(t);
  string newstr;

  if (len == 1) {
    char in = sp[0];

    for (int i=0; i<= st.length(); i++) {
      newstr = st.substr(0, i) + in + st.substr(i);
      combs.pb(newstr);
    }

    for_each (all(combs), debug);
  }
  else {
    // 2 special chars
    // algo : Nice :  insert 1 char, save in vec , insert the next
    char one=sp[0];
    char two=sp[1];
    vs onecomb, twocomb;

    for (int i=0; i<= st.length(); i++) {
      newstr = st.substr(0, i) + one + st.substr(i);
      onecomb.pb(newstr);
    }

    tr(onecomb, it) {
      // *it is string
      string st = *it;
      string newstr;

      for (int i=0; i<= st.length(); i++) {
        newstr = st.substr(0, i) + two + st.substr(i);
        twocomb.pb(newstr);
      }
    }

    for_each (all(twocomb), debug);
  }

}

int main () {
  char s[] = "test";
  char *sp[] = { "#", "12" };
  int s2 = SizeOfArray(sp);

  #if 0
  string st = "test", mod;

  for (int p = 0; p<=st.length(); p++ ) {
    mod = st.substr(0, p) + "#" + st.substr(p);
    cout << "\n mod = " << mod;
  }
  #endif

#if 0
  cout << st.substr(0) << "|"
    << st.substr(1) << "|"
    << st.substr(2) << "|"
    << st.substr(3) << "|"
    << st.substr(4) << "|";

  cout << st.substr(0,0) << "|"
    << st.substr(0,1) << "|"
    << st.substr(0,2) << "|"
    << st.substr(0,3) << "|"
    << st.substr(0,4) << "|";

#endif

  //cout << "\nsize == " << size << " | s2 = " << s2;
  for (int i = 0; i<s2; i++)
    interpol (sp[i], strlen (sp[i]), s);

    return 0;
}
