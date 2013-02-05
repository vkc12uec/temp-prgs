
// Write a function that takes in two binary strings and returns their sum (also a binary string).

void add (string one, string two, string& res) {
  int s=0, c=0;
  helper (one, one.len, two, two.len, res, c);
}

void addbits (char c1, char c2, int &s, int &prevc) {
  // int value of c1, c2;
  s = c1 ^ c2;
  int c = c1 & c2;

  s = s^prevc;
  prevc = (c==0)? 0 : 1;
}

void helper (string s1, int l1, string s2, int l2, int &res, int &c) {
  int s=0;
  if (l1==-1 && l2==-1)
    return ;
  else if (l1==-1) 
    addbits (0, s2[l2], s, c);
  else if (l2==-1) 
    addbits (s1[l1], 0, s, c);

  else {
    addbits (s1[l1], s2[l2], s, c);
  }
  res += char(s);

  helper (s1, l1-1, s2, l2-1, res, c);
}


int main () {
  string s1 = "1101", s2="10111";
  string res = "";
  add (s1,s2, res);

  // now u check which string is remaining
}
