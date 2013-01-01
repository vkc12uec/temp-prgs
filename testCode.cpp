/*
Glob can have a, b, ? and *, any number of times, any location.

E.g.
test= {a,b,a,a,a,a,b,b,b,b,b,b}
glob = {a,?, *, b}

Now, ? means ANY character, single occurrence. So it's either a or b, one time
* means ANY OR NO character, any number of occurrences.
* */

bool isMatch (char *t, char *g) {
  if (t==NULL && g==NULL)
    return true;
  else if (t==NULL || g==NULL)
    return false;

  if (*t == *g || *g == '?')
    return isMatch (t+1, g+1)
  else if (*g == '*') {
    bool ret=false;
    for (int eat=0; eat < strlen(t); eat++) {
      ret = isMatch (t+eat, g+1)
        if (ret == true)
          break;
    }
  }
}

/*
    '.' Matches any single character.
    '*' Matches zero or more of the preceding element.
    The matching should cover the entire input string (not partial).
    The function prototype should be:
    bool isMatch(const char *s, const char *p)

    Some examples:
    isMatch("aa","a") ? false
    isMatch("aa","aa") ? true
    isMatch("aaa","aa") ? false
    isMatch("aa", "a*") ? true
    isMatch("aa", ".*") ? true
    isMatch("ab", ".*") ? true
    isMatch("aab", "c*a*b") ? true

    There are four patterns in the regular expression: 
    c*
    .*
    .
    c
 */

bool isMatch (const char *t, const char *p) {
  if (*t == 0 && *p == 0)
    return true;
  else if (*t == 0 || *p == 0)
    return false;

  if (*t == *p || *p == '.')
    return isMatch (t+1, p+1)
  else if (*p == '*') {
    char *prev = p-1;
    switch (prev) {
      case '.':
        break;
      default:
        return isMatch (t+1, p) || isMatch (t+1, p+1);
    }
  }

}

//# binary stream divisble by 3:
// #1s at even - #1s at odd

bool isDiv3 (ifstream &inp) {
  int neven, nodd;
  neven = nodd = 0;
  int c=0, ch=-1;

  while (inp >> ch) {
    if (ch == 1) {
      if (c&1)
        ++nodd;
      else
        ++neven;
    }

    ret = (neven-nodd) % 3 ? true : false;
    c++;
  }
}

//# use binary search to find where to insert. Return 'begin'

int whereInsert (int a[], int len, int target) {
  int beg, mid, end;
  beg = 0, end = len-1;

  while (beg <= end) {
    mid = (end+beg)/2;
    if (a[mid] == target)
      return mid;           // if arr is like: 123456 target=5
                            // but if arr like 12345555678  t=5 ?
    else if (a[mid] > target)
      end = mid-1;
    else if (a[mid] < target)
      beg = mid+1;
  }
}


// if arr like  112223334555567778
// find # times 5 appears
{
  static beg=0, end = n-1;
  while (beg <= end) {
    mid = (beg+end)/2;
    if (a[mid] <target && a[mid+1] == target)      //&& a[mid+1] > target)
      beg = mid;
    else if (a[mid] > target && a[mid-1] == target)
      end = mid;
  }
}

// CAS
bool *CAS (int *v, int old, int new) {
  int t = *v;
  if (t == old) {
    *v = new;
    return true;
  }
  else
    return false;
}

// LCS : common subsequence

int LCS (const char *a, int l1, const char *b, int l2) {
  int m[l1+1][l2+1];

  for (int i=0; i<l2+1; i++)
    m[0][i] = 0;
  for (int i=0; i<l1+1; i++)
    m[i][0] = 0;

  for (int i=1; i<=l1; i++) {
    for (int j=1; j<=l2; j++) {
      if (a[i] == b[j])
        m[i][j] = 1+m[i-1][j-1];
      else 
        m[i][j] = max (m[i-1][j], m[i][j-1])
    }
  }
  return m[l1][l2];
}

function backtrack(C[0..m,0..n], X[1..m], Y[1..n], i, j)
    if i = 0 or j = 0
        return ""
    else if  X[i] = Y[j]
        return backtrack(C, X, Y, i-1, j-1) + X[i]
    else
        if C[i,j-1] > C[i-1,j]
            return backtrack(C, X, Y, i, j-1)
        else
            return backtrack(C, X, Y, i-1, j)

int main () {
  const char *a = "";
  const char *b = "";

  cout << "\n longest LCS "<< LCS (a, strlen(a), b, strlen(b));
  return 0;
}


//   level order printing can be done using 2 counters which count the nodes in curr_level and next_level
void levelOrder (node *r) {
  Queue<node*> q;
  int curr=1, next=0;
  q.push(r);

  while (1) {

    for (take=0; take<curr; take++) {
      node *t = q.pop();
      cout << t->data << " ";
      if (t->lc) q.push(t->lc); ++next;
      if (t->rc) q.push(t->rc); ++next;
    }
    cout << "\n";

    curr = next;
    next=0;

    if (q.IsEmpty())
      break;
  }
}

/*
# fb interview: find all words in dict which can appear in a 2D matrix. Boogle game
  http://basicalgos.blogspot.com/2012/04/42-find-all-possible-words-from-2d.html
 */

bool isWord(string s) { }     // given

void helper (char m[][3], int r, int c, int sr, int sc, vvi visited, string pref) {

  if (visited[sr][sc] == true) return;

  if (is_word(pref)) {
    cout << pref;
    return;
  }
  visited[sr][sc] = 1;

  // left , right , up , down
  foreach option in 4options {
    if (option not visited) helper (_1, _2, _3, sr+x, sc+x, visited, pref+m[sr+x][sc+x])
  }

  visited[sr][sc]=0;
}

void print_words (char m[][3], int r, int c) {
  vvi visited (3, vi(3,0));

  for (int i=0; i<r; i++)
      for (int j=0; j<c; j++)
        helper (m, r, c, i, j, visited, string(m[i][j]));
}

int main() {
  char *m[] = {"car", "cow", "con"};
  print_words (m, 3, 3);
  return 0;
}


//# serialze any N tree or binary-tree

class Node {
  int data;
  vector<Node*> list;
}

string serialze (node *r) {
  if (!r) return "";
  sstream ss;
  Queue <node*> q;

  q.push (r);

  while (!q.IsEmpty()) {
    node *t = q.delete();

    ss << t->data << t->list.size();

    tr (t->list, it) {
      q.push (*it);
    }

  }

  return ss.str();
}

// deserialize above string to tree

Node *desrial (string s) {
  sstream ss(s);
  int data, nc;

  ss >> data >> nc;

  Node *r = new Node (data, nc);
  Q.add (r);

  while (!Q.isEmpty()) {

    Node *r = Q.delete();

    for (curr=0; curr<r->nc; curr++) {
      ss >> data >> cnc;
      Node *t = new Node (data, cnc);
      r->list.pb(t);
      Q.push (t);           // vs if (cnc>0) Q.push(t)
    }
  }

}

//# code to print partitions of N=8  amz_N_as_sumElements.cpp
//  8->{[8], [6, 2], [5, 3], [4, 4], [4, 2, 2], [3, 3, 2], [2, 2, 2, 2]}

int main () {
  int N=8;
  int sample[N-1], ptr=0;

  for(int i=0;i<N-1;i++)
    sample[i]=i+2;
  
  int fill[N-1];

  int base=0;     // start wiht sample[0]
  partition (N, sample, N-1, fill, ptr);

  return 0;
}

void partition (int N, int sample[], int slen, int fill[], int ptr, int base) {
  if (!N) {
    // print fill[] till ptr
    // return
  }

  for (sid=base; sid < slen; sid++)
    if (N-sample[sid] >= 0) {
      fill[ptr] = sample[sid];
      partition (N-sample[sid], sample, slen, fill, ptr+1, base);   // last param is NOT base , its 'sid'
    }
}

/*
# amz. Q. 
      How to find maximum path sum in a binary tree.
      The path need not be a top-bottom, can start and end nodes need not be root or leaf, path can start in left/right subtree and end in right/left subtree wrt any node

      # Sol: There can be 2 types of sum. (1) passing thru LCA (2) on a linear path
*/

// 1st sum linear path
//
int max = INT_MIN;
static node *maxNode;

void post (node *n) {
  if (n) {
    lsum = post(n->left);
    rsum = post(n->right);

    if (n is leaf)
      return n->data
    else  {
      lcaSum = n->data + lsum + rsum;
      max = algo.max (algo.max (max (lsum+rsum) + n->data) , lcaSum );
      return max (lsum+rsum) + n->data;
    }
  }
}

/*

7) In a store there are a million distinct items. You have to list the k most sold items at the end of day. Give the data structure/algorithm you will use for the following cases
                  a) You have to list the items in sorted order of number items sold,
                  b) Sorted order is not necessary, so just print the items in any order
// 
*/

vector<item> list;
Heap h(k);        //min heap

for (i=0; i<k; i++)
h.insert (list[i]);

for (i=k; i<1milllion; i++) {
  if (list[i].sales > h[0]) {
    h.ExtractMin();
    h.Insert (list[i].sales);
  }
}

/*
1) Write code to multiply 2 matrices, check for corner cases, erroneous inputs etc.
 */
A[ij] B[jk] = C[ik]

void mult (A, i, j, B, j, k, C) {

  C = new int *[i];
  for (p=0;p<i; p++)
    C[p] = new int[k];

  for (mi=0; mi<i; mi++)
    for (nk=0; nk<k; nk++) {
      tmp=0;
      for (pj=0; pj<j; pj++)
        tmp += A[mi,pj]*B[pj,nk];

      C[mi,nk] = tmp;

    }
}

/*
 *
 you have a matrix of N x N filled with 1 or 0. you can move only 1 step either right or 1 step down. you need to count maximum number of "connected 1" in given matrix. for example
 0 0 1 1
 1 1 1 0
 1 0 1 0
 0 1 0 1
 [Start from top left] maximum no. of 1 is 4
 [1,0][1,1][1,2][2,2]
 * 
 */

int dp[n][n] = {0};
int a[][]; //given

for (int i=1; i<n; i++) {
  if (a[0][i] == 0)
    a[0][i] = 0;
  else
    dp[0][i] += dp[0][i-1];

  if (a[i][0] == 0)
    dp[i][0] = 0;
  else
    dp[i][0] += dp[i-1][0];
}

  for (int j=0; j<n; j++) {
  }
}

for (int i=0; i<n; i++) {
  for (int j=0; j<n; j++) {
    if (a[i][j] == 0)
      dp[i][j] = 0;
    else {
      if (i==0 || j==0)
      dp[i][j] = max (dp[i-1][j], dp[i][j-1]) + 1;
    }
  }
}


/*
   5 Answers
   Develop a function which will return either true or false. But at any point of time it should not return more than N number of true (it can be less than N) in last X secs.
   */

const int N;
const int X;

bool f() {
  static int lastcall;
  static int cnt=0;
  int currtime;

  if (lastcall == NULL)
    lastcall = time(0);

  ret = 0|1 ;     // choose false or true ?

  if (ret == false)
    return ret;
  else {
    if (currtime - lastcall < X) {
      if (cnt < N) {
        cnt++
          return true;
      }
      else
        return false;
    }
    else {
      lastcall=NULL;
    }
  }
}


/*
 * goog
 *
 2) Given a matrix M, check whether 2 rows are exactly equal in the matrix. Optimize time complexity.

 Eg. M  =        1 2 3, then rows 1 and 3 are same.
 3 4 5
 1 2 3
 */














