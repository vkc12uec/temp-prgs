###########################################
vids:
#http://openclassroom.stanford.edu/MainFolder/CoursePage.php?course=IntroToAlgorithms

http://www.cs.pitt.edu/~kirk/algorithmcourses/index.html


###########################################
To lower the overhead a more elaborate locking protocol test and test-and-set is used. The main idea is not to spin in test-and-set but increase the likelihood of successful test-and-set by using the following entry protocol to the lock:
boolean locked := false // shared lock variable
procedure EnterCritical() {
  do {
    while (locked == true) skip // spin until lock seems free
  } while TestAndSet(locked) // actual atomic locking
}
Exit protocol is:
procedure ExitCritical() {
  locked := false
}
The entry protocol uses normal memory reads to spin, waiting for the lock to become free. Test-and-set is only used to try to get the lock when normal memory read says it's free. Thus the expensive atomic memory operations happens less often than in simple spin around test-and-set.
'
###########################################
Area of polygon by triangulation:

          int area = 0;
          int N = lengthof(p);
          //We will triangulate the polygon
          //into triangles with points p[0],p[i],p[i+1]

          for(int i = 1; i+1<N; i++){
              int x1 = p[i][0] - p[0][0];
              int y1 = p[i][1] - p[0][1];
              int x2 = p[i+1][0] - p[0][0];
              int y2 = p[i+1][1] - p[0][1];
              int cross = x1*y2 - x2*y1;
              area += cross;
          }
          return abs(cross/2.0);


######################

          
* convex hull simple:

    convexHull(point[] X){
        int N = lengthof(X);
        int p = 0;
        //First find the leftmost point
        for(int i = 1; i<N; i++){
            if(X[i] < X[p])
                p = i;
        }
        int start = p;
        do{
            int n = -1;
            for(int i = 0; i<N; i++){

                //Don't go back to the same point you came from
                if(i == p)continue;

                //If there is no N yet, set it to i
                if(n == -1)n = i;
                int cross = (X[i] - X[p]) x (X[n] - X[p]);

                if(cross < 0){
                    //As described above, set N=X
                    n = i;
                }
            }
            p = n;
        }while(start!=p);
    }


    ""''//\\
* Convex hull code (when we can have multiple points on the hull edge)

    //If onEdge is true, use as many points as possible for
    //the convex hull, otherwise as few as possible.
    convexHull(point[] X, boolean onEdge){
        int N = lengthof(X);
        int p = 0;
        boolean[] used = new boolean[N];
        //First find the leftmost point
        for(int i = 1; i<N; i++){
            if(X[i] < X[p])
                p = i;
        }
        int start = p;
        do{
            int n = -1;
            int dist = onEdge?INF:0;
            for(int i = 0; i<N; i++){
                //X[i] is the X in the discussion

                //Don't go back to the same point you came from
                if(i==p)continue;

                //Don't go to a visited point
                if(used[i])continue;

                //If there is no N yet, set it to X
                if(n == -1)n = i;
                int cross = (X[i] - X[p]) x (X[n] - X[p]);

                //d is the distance from P to X
                int d = (X[i] - X[p]) · (X[i] - X[p]);
                if(cross < 0){
                    //As described above, set N=X
                    n = i;
                    dist = d;
                }else if(cross == 0){
                    //In this case, both N and X are in the
                    //same direction.  If onEdge is true, pick the
                    //closest one, otherwise pick the farthest one.
                    if(onEdge && d < dist){
                        dist = d;
                        n = i;
                    }else if(!onEdge && d > dist){
                        dist = d;
                        n = i;
                    }
                }
            }
            p = n;
            used[p] = true;
        }while(start!=p);
    }



###########################################
topcoder:
http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=geometry1

###########################################
  // Assigns a String object to this object.  Self-assignment works.

  const String& operator=(const String& rhs) {

    if (this != &rhs) {

      delete[] c_str_;

      if (rhs.c_str() == NULL) {

        c_str_ = NULL;

        length_ = 0;

      } else {

        ConstructNonNull(rhs.c_str(), rhs.length());

      }

    }


    return *this;

  }

###########################################
#include <iostream>
using namespace std;

template <typename T, size_t N>
inline
size_t SizeOfArray( const T(&)[ N ] )
{
  return N;
}

int main()
{
  const char s[] = "Hello world!";

  cout << "s[] is " << SizeOfArray( s )
       << " characters long.\n";
  cout << "(That includes the null at the end.)\n";

  return 0;
}
''"
###########################################

# polygon area by triangulation:

The reason this works is that the positive and negative number cancel each other out by exactly the right amount. The area of ABC and ACD ended up contributing positively to the final area, while the area of ADE contributed negatively. Looking at the original polygon, it is obvious that the area of the polygon is the area of ABCD (which is the same as ABC + ABD) minus the area of ADE. One final note, if the total area we end up with is negative, it means that the points in the polygon were given to us in clockwise order. Now, just to make this a little more concrete, lets write a little bit of code to find the area of a polygon, given the coordinates as a 2-D array, p.

int area = 0;
int N = lengthof(p);
//We will triangulate the polygon
//into triangles with points p[0],p[i],p[i+1]

for(int i = 1; i+1<N; i++){
    int x1 = p[i][0] - p[0][0];
    int y1 = p[i][1] - p[0][1];
    int x2 = p[i+1][0] - p[0][0];
    int y2 = p[i+1][1] - p[0][1];
    int cross = x1*y2 - x2*y1;
    area += cross;
}
return abs(cross/2.0);

###########################################

# Seive of Erasthones

public boolean[] sieve(int n)
{
   boolean[] prime=new boolean[n+1];
   Arrays.fill(prime,true);
   prime[0]=false;
   prime[1]=false;
   int m=Math.sqrt(n);

   for (int i=2; i<=m; i++)
      if (prime[i])
         for (int k=i*i; k<=n; k+=i)
            prime[k]=false;

   return prime;
} 

###########################################
# AMzN:
# Tree with internal nodes, and leaves ... Given preorder, form the tree .... 
# http://tech-queries.blogspot.com/search/label/Amazon%20Interview
#
tree* newnode(char c)
{
    tree *node = new(tree);
    node->val = c;
    node->left = node->right = NULL;
    return node;
}

tree* construct_tree(char* A, int *i)
{
    //Boundary Condition
    if (A == NULL){
            return NULL;
    }

    tree *node = newnode(A[*i]);
    //On reaching leaf node, return
    if (A[*i] == 'L'){
            return node;
    }

    //Populate left sub tree
    *i = *i + 1;
    node->left = construct_tree(A, i);

    //Populate right sub tree
    *i = *i + 1;
    node->right = construct_tree(A, i);

    return node;
}

http://tristan-interview.blogspot.com/search/label/recursion

Solution: The key is to understand what can uniquely denote a tree (or serialize a tree). A good way to serialize a tree is to record the pre-order traversal of a binary tree plus the nil virtual leaf information. If we denote an actual node as "1", the nil virtual leaf as "0". The sequence "10100" will stand for the following tree:


                  *           
               /      \                     
             nil       *
                      /    \
                   nil    nil

The way to decide the nil leaf is to check the children of a node. If a node is a leaf in the tree, it will have two nil virtual leaves, since a leaf won't have any children.  Similarly, we can know the sequence "11000" will stand for the following tree:


                  *           
                 /  \                 
               *    nil
              /  \
           nil  nil

Therefore,  our target is to enumerate all possible sequences. There are several constraints on the sequences:

For a n node tree, the length of the sequence will be 2n+1 with n "1" and n+1 "0".
For any position i in the sequence s and i != 2n,  the number of "1" should always be no smaller than the number of "0" in the sub-sequence s[0, i].



# 
###########################################
# AMZN: Given a number,find the next higher number using the same digits in the number. Eg- 15432, Soln- 21345.

algo: look from right to left till there is high to low transition .. say config is S...T...L
S start
T transition
L low

- sort in ascending order nos[T...L]
- Now, the rightmost element of S...T say X .... find the no. which is greater that X in the above sorted sequence and swap...

e.g. 12345  =>  12354

12453	->	12435 (mid)	->	12534

e.g. 12532 -> 12235(mid) -> 13225

###########################################
# strstr in C:

void BruteForce(char *x /* pattern */,
    int m /* length of the pattern */,
    char *y /* actual string being searched */,
    int n /* length of this string */)
{
  int i, j;
  printf("\nstring : [%s]"
      "\nlength : [%d]"
      "\npattern : [%s]"
      "\nlength : [%d]\n\n", y,n,x,m);


  /* Searching */
  for (j = 0; j <= (n - m); ++j)
  {
    for (i = 0; i < m && x[i] == y[i + j]; ++i);
    if (i >= m) {printf("\nMatch found at\n\n->[%d]\n->[%s]\n",j,y+j);}
  }
}

###########################################
# code to find the in-order successor of a given p
#
void ino (node *r, node *p) {
  if (p == r)
    cout << r->right->data;     // err, it shud be lowest element in r's right subtree'
  int flag = 0;
  ino_helper (r, p, flag);
}

# version 1 (to stop the immediate exectution after printint the successor, 'flag' shud be such that progressive recurvise calls
# are also stopped

void ino_helper (node *r, node *p, int &flag) {
  if (!r)
    return;
  ino_helper (r->left, p, flag);
  if (flag == 1)
    print r->data is successor
  if (r == p)   /*this order of 2 if s is important*/
    flag = 1;
  ino_helper(r->right, p , flag);
}

# version 2: stopping progressive calls, either use 'flag' very outside or use iteraitve inorder with extra condition

void ino_helper (node *r, node *p, int &flag) {
  if (flag == STOP)
    return;
  if (!r)
    return;
  ino_helper (r->left, p, flag);
  if (flag == 1)
    print r->data is successor
  if (r == p)   /*this order of 2 if s is important*/
    flag = 1;
  ino_helper(r->right, p , flag);
}

###########################################
Three Colours: dutch national flag problem

The problem was posed with three colours, here `0', `1' and `2'. The array is divided into four sections:

a[1..Lo-1] zeroes (red)
a[Lo..Mid-] ones (white)
a[Mid..Hi] unknown
a[Hi+1..N] twos (blue)
The unknown region is shrunk while maintaining these conditions
Lo := 1; Mid := 1; Hi := N;
while Mid <= Hi do
Invariant: a[1..Lo-1]=0 and a[Lo..Mid-1]=1 and a[Hi+1..N]=2; a[Mid..Hi] are unknown.
case a[Mid] in
0: swap a[Lo] and a[Mid]; Lo++; Mid++
1: Mid++
2: swap a[Mid] and a[Hi]; Hi--  (no mid-- becoz u still have to see that value)


###########################################

# reverse the bits:
#
I am trying to reverse the bits in a number
The following fucntion successfully reverses the bits, but the runtime is O(n).

for ( unsigned i = 0; i < n_bits; ++i ) {
    rev_bit = (rev_bit<<1) | ( val & 1 );
    val >>= 1;
  }

###########################################
# random line from a file
#
srand;
open FILE, "<filename" or die "Could not open filename: $!\n";
rand($.)<1 and ($line=$_) while <FILE>;       # The function call rand ($.) picks a random number between 0 and the current line number
close FILE;
print "Random line is $line\n";

#
Obviously, a file with one line (N=1) is fair: you always keep the first line because 1/1 = 100%, making it fair for files of 1 line. For a file with two lines, N=2. You always keep the first line; then when reaching the second line, you have a 50% chance of keeping it. Thus, both lines have an equal chance of being selected, which shows that N=2 is fair. For a file with three lines, N=3. You have a one-third chance, 33%, of keeping that third line. That leaves a two-thirds chance of retaining one of the first two out of the three lines. But we've already shown that for those first two lines there's a 50-50 chance of selecting either one. 50 percent of two-thirds is one-third. Thus, you have a one-third chance of selecting each of the three lines of the file.

In the general case, a file of N+1 lines will choose the last line 1/(N+1) times and one of the previous N lines N/(N+1) times. Dividing N/(N+1) by N leaves us with 1/(N+1) for each the first N lines in our N+1 line file, and also 1/(N+1) for line number N+1. The algorithm is therefore fair for all N, where N is a positive integer.

###########################################

rough:
======

20,1, 5 ,7 ,11,16
0, 1, 2, 3, 4,  5

18	22	12	11	7	5	1
0	1	2	3	4	5	6

lo	high	mid
0	6	3, 11
0	2	1, 22

#define N 10
struct node {
	node childs[N];
	node *ancestor;
	bool mylock;
}

###########################################
# Do division of a/b w/o using division operator:
# use binary search to get which multiple to choose ...
#
// computes a = b*q + r with 0 <= r < b
void divide(unsigned a, unsigned b, unsigned& quo, unsigned& rem) {
  // suppose numbers are positive
  if(a < b) {
    quo = 0; rem = a;
    return;
  }
  quo = 1;
  while(quo*b*2 <= a) {
    quo *= 2;
  }
  // here it holds that: quo*b <= a < quo*b*2
  if(quo * b == a) {
    rem = 0;
    return;
  }

  unsigned ql = quo, qr = quo*2, mid;
  while(1) {
    mid = (ql + qr) / 2;
    if(mid*b <= a && a < (mid+1)*b)     // IMPORTANT step
      break;
    if(mid*b < a) {
      ql = mid+1;
    } else {
      qr = mid;
    }
  }
  quo = mid, rem = a - quo * b;
}


int main() {
  unsigned a = 2556721331, b = 13, q, r;
  printf("correct: %d %d\n", a / b, a % b);
  divide(a, b, q, r);
  printf("test: quo: %d; rem: %d\n", q, r);
  return 1;
}

###########################################
# sort a stack:

# mtd 1:
void sort (Stack S) {
  if (S.isEmpty())
    return;
  int t = S.pop();
  sort (S);         // sort the stack
  insert_in_sorted (t, S);    // insert a value t in sorted stack
}

void insert_in_sorted (int t, Stack S) {
  if (S.isEmpty()) {
    S.push(t);
    return;
  }
  if (t < S.peek()){    // assumes that S is in ascending order, going downwards
    int x = S.pop();
    insert_in_sorted (t, S);
    S.push (x);
  }
  else {
    S.push (t);
  }
}

# mtd 2:

# push smallest at level n, 2nd smallest at level n-1 ....
void sortStack () {
n = S.length();
for (i=n;i>=1;i--)
	pushsmallest (s, i, INT_MAX);
}

# push smallest element of stack from top to level at position level
# recursion goes from top to level and finds the smallest element in that range
# and pushes that in the leaft of recssion
#
void pushsmallest (s, int level, int small) {
	if (level == 1) {
		s.push (small);
	}
	else {
    int to_be_pushed = s.pop();
		if (to_be_pushed < small) {
      to_be_pushed = small;     # corrected
			small = to_be_pushed;
      #flag = 1;
    }
		pushsmallest (s, level-1, small)
		s.push (to_be_pushed);
	}
}

###########################################
# reverse a stack:

# mtd 1:
void ReverseStack(Stack s)
{
   if(isEmpty(s) return;
   x=pop(s);
   ReverseStack(s);
   RecursivePush(s,x);
}
RecursivePush(Stack s,int x);
 {
  int temp;
  if(isEmpty(s)) {
    push(s,x);
     return;
  }
  temp=pop(s);
  RecursivePush(s,x);
  push(s,temp);
}

# mtd 2:
void revStack () {
n = S.length();
for (i=n;i>=1;i--)
	pushR (s, i);
}

# this pushes top value to level i
void pushR(s, int level) {
	top = S.pop ();
	pushhelper (s, top, level)
}

# recurseive push at level
void pushhelper (s, int value, int level) {
	if (level == 1)
		s.push(value);
	else {
		newtop = s.pop();
		pushhelper (s, value, level-1)
		s.push (newtop);
		}
}

###########################################
# reverse a C string:

  char *a = str;
  int n = len;
  for (int i=0;i<(n/2);i++) {
    char c = a[i];
    a[i] = a[n-i-1];
    a[n-i-1] = c;
  }

# # ###########		reverse just the words:
#       reverse = [o ateb si siht]
#       answer = [o beta is this]

  int word_st = 0, word_end = 0, curr = 0;
  int flag = 0;

  while (a[curr] != 0) {
    if (a[curr] == ' ') {
      //word_end = curr-1;
      reverse_part (a, word_st, curr-1);
      flag = 0; // for new word_st
    }
    else {
      if (flag == 0) {
        word_st = curr;
        flag = 1;
      }
      }
      curr++;
  }
  reverse_part (a, word_st, curr-1);



###########################################
# merge 2 sorted linked list

node * merge (node *a, node *b) {
	if (!a)
		return b;
	else if (!b)
		return a;
	node *small = (a->data > b->data) ? b : a;
	node *large = (a->data > b->data) ? a : b;
	node *res=small;
	small = small->next;

	while (small && large) {
		if (small->data < large->data){
			res->next = small;
			small = small->next;
			}
		else {
			res->next = large;
			large = large->next;
		}
		res = res->next;
	}	// end of while

	if (!small)
		res->next = large;
	else if (!large)
		res->next = small;
}

void mergeSort (node *n) {
	node *mid = getMid (n);
	node *head1 = n;
	node *head2 = mid->next;

	mergeSort (head1);
	mergeSort (head2);
	merge (head1, head2);
}

node *getMid (node *n) {
	node *slow =  n;
	node *fast = n;

	while (!fast || !fast->next) {
		slow = slow->next;
		fast = fast->next->next;
	}
	return slow;
}

t(n) = 2t(n/2) + n

###########################################

Q. Given a array,find out if there exist a subarray such its sum is zero.

subarray=>contiguous slice
take cumulative sum of the array; if the cumulative sum has duplicate numbers then there is subarray which sums to zero;

for(i=1;i<n;i++)
  c[i]=c[i-1]+input[i];
if(duplicates in array 'c')
then true

Complexity-O(n);

###########################################
# check if a tree is symettric , not data , but symettric perpendicular to root
#
here asked only structure not the data......

int symTree(node *a , node *b)
{
  if(a == NULL && b == NULL)
  {
    return 1;
  }
  else if( a != NULL && b!= NULL)
  {
    return (//if data should be check then
        //a->data == b->data &&
        symTree(a->left,b->right) &&
        symTree(a->right,b->left));
  }
  else
  {
    return 0;
  }
}



# mtd 2:

This can be answered through a variant of inorder traversal. For example take the following tree
1
/ \
2 3
/ \ / \
4 5 6 7
\ / \ /
9 1 1 2

If you take the inorder traversal of the left subtree and instead of printing the node print whether the node is left child (L) or right child (R) w.r.t its parent. So for the left subtree you will have:
L R L L R

Similar for the right subtree you will have:
L R R L R

Now reverse the right subtree sequence:
R L R R L

flip the R to L and L to R:
L R L L R

Now this is equal to the left subtree's sequence and hence voila

# how to produce this L R L L R sequence:

int arr[100];
static int index = 0;
void Inorder (node *n, int which_child) {
  if (!n)
    return;
  Inorder (n->left, 0);
  arr [index++] = which_child;
  Inorder (n->right, 1);
}

'
###########################################
Q: give a binary tree (not BST)where tree node, with extra pointer inorder-successor, initaliy all inorder-successor pointer set to NULL.
write a code to set all pointer to its inordersuccessor.
struct Node
{
int data;
Node *left, *right;
Node *successor;
};

# algo: if u do reverse inorder traversal, then at every node, u can assign its succ pointer
# prpovided u keep its info
#
node *su = 0;     // pass su by ref
void rIno (node *n, node *&su) {
	if (n) {
		rIno(n->right, su);
		n->succ = su;
		su = n;
		rIno(n->left, su);
	}
}

###########################################
# read a BST preorder string from a file and convert it to tree:
#
Remember my post: Determine if a Binary Tree is a Binary Search Tree (BST)?

We use the same idea here. We pass the valid range of the values from the parent node to its child nodes. When we are about to insert a node, we will check if the insert value is in the valid range. If it is, this is the right space to insert. If it is not, we will try the next empty space. Reconstructing the whole BST from a file will take only O(n) time.

void readBSTHelper(int min, int max, int &insertVal,BinaryTree *&p, ifstream &fin) {
  if (insertVal > min && insertVal < max) {
    int val = insertVal;
    p = new BinaryTree(val);
    if (fin >> insertVal) {
      readBSTHelper(min, val, insertVal, p->left, fin);
      readBSTHelper(val, max, insertVal, p->right, fin);
    }
  }
}

void readBST(BinaryTree *&root, ifstream &fin) {
  int val;
  fin >> val;
  readBSTHelper(INT_MIN, INT_MAX, val, root, fin);
}



###########################################
# LCA of bt
#
node *LowestCommonAncestor( node *root , node *p , node *q)
{
	node *l , *r , *temp;
	if(root==NULL)
	{
		return NULL;
	}

	if(root->left==p || root->left==q || root->right ==p || root->right ==q)
	{
		return root;
	}
	else
	{
		l=LowestCommonAncestor(root->left , p , q);
		r=LowestCommonAncestor(root->right , p, q);

		if(l!=NULL && r!=NULL)
		{
			return root;
		}
		else
		{
			temp = (l!=NULL)?l:r;
			return temp;
		}
	}
}

###########################################
# make a perfect maze:
# http://www.mazeworks.com/mazegen/mazetut/index.htm

create a CellStack (LIFO) to hold a list of cell locations
set TotalCells = number of cells in grid
choose a cell at random and call it CurrentCell
set VisitedCells = 1

while VisitedCells < TotalCells
	find all neighbors of CurrentCell with all walls intact
	if one or more found
		choose one at random
		knock down the wall between it and CurrentCell
		push CurrentCell location on the CellStack
		make the new cell CurrentCell
		add 1 to VisitedCells
	else
		pop the most recent cell entry off the CellStack
		make it CurrentCell
	endIf
endWhile


###########################################
Given a modified BST where each node carries extra information of the total number of nodes below it. Find the Kth smallest number in O(logn) time.

thought: if left child count is < k, then reqd. no. may be root or on right
	else
	on left

int kthele (node *n, int k) {
	if (!n || (n->below + 1 < k) )
		return -1;	# no solution exists
	## base case, k=1 and n=NULL
	if (n->left == 0 && k==1)
		return n->data;

	int below_lc = n->left->below;
	if (below_lc == 0) {
		# my lc is the leaf
		if (k == 2)
			return n->data;
		else if (k>2)
			return kthele (n->right, k-2);
	}
	else if (below_lc + 1 + 1 == k) {
		return n->data;
		}
	else if (below_lc + 1 + 1 < k) {
		return kthele (n->right, k-below_lc -2);
	}
	else {
		## reqd. no. lies on left
		return kthele (n->left, k);
	}
}

###########################################
# diameter of a binary tree:

Max of following 3:
- diameter of left
- diameter of right
- path b/w left and right sub trees passing thru root

# vkc code:
int height (node *n) {
		if (!n) return 0;
		int hl = height (n->left);
		int hr = height (n->right);
		int myheight  = math.max (hl, hr) + 1;
		if (n->left && n->right) {
			int mypass_dia = math.max (hl+hr, n->left->dia, n->right->dia);
			# assume chids dia's exixts
			n->dia = mypass_dia;
		}
		if (!n->left && !n->right)
			n->dia = 0;
			#elseif (!n->left || !n->right)
			#n->dia = 0;
		return myheight;
}

# online code, calls Sahni's height from postorder diameter fn.
#
int diameter(struct node * tree)
{
   /* base case where tree is empty */
   if (tree == 0)
     return 0;

  /* get the height of left and right sub-trees */
  int lheight = height(tree->left);
  int rheight = height(tree->right);

  /* get the diameter of left and right sub-trees */
  int ldiameter = diameter(tree->left);
  int rdiameter = diameter(tree->right);

  /* Return max of following three
   1) Diameter of left subtree
   2) Diameter of right subtree
   3) Height of left subtree + height of right subtree + 1 */
  return max(lheight + rheight + 1, max(ldiameter, rdiameter));
}

/* UTILITY FUNCTIONS TO TEST diameter() FUNCTION */

/*  The function Compute the "height" of a tree. Height is the
    number f nodes along the longest path from the root node
    down to the farthest leaf node.*/

-     O(n) time

int height(struct node* node)
{
   /* base case tree is empty */
   if(node == NULL)
       return 0;

   /* If tree is not empty then height = 1 + max of left
      height and right heights */
   return 1 + max(height(node->left), height(node->right));
}



###########################################
# in a binary tree, find the minimum element at a given depth.

Queue Q<int>;
int g_min=INT_MAX;

void getminatd (node *n, int d) {
	if (n) {
		if (!d) {
			#//Q.push(n->data);
			g_min = (n->data < g_min) n->data  : g_min;
			return; # quick return, dont call next recurs.
		}
		getminatd (n->left, d-1);
		getminatd (n->right, d-1);
	}
	return;
}

###########################################
# median of 2 sorted arrays.

http://geeksforgeeks.org/archives/2105

Method 2 (By comparing the medians of two arrays)
This method works by first getting medians of the two sorted arrays and then comparing them.

Let ar1 and ar2 be the input arrays.

Algorithm:

1) Calculate the medians m1 and m2 of the input arrays ar1[]
   and ar2[] respectively.
2) If m1 and m2 both are equal then we are done.
     return m1 (or m2)
3) If m1 is greater than m2, then median is present in one
   of the below two subarrays.
    a)  From first element of ar1 to m1 (ar1[0...|_n/2_|])
    b)  From m2 to last element of ar2  (ar2[|_n/2_|...n-1])
4) If m2 is greater than m1, then median is present in one
   of the below two subarrays.
   a)  From m1 to last element of ar1  (ar1[|_n/2_|...n-1])
   b)  From first element of ar2 to m2 (ar2[0...|_n/2_|])
5) Repeat the above process until size of both the subarrays
   becomes 2.
6) If size of the two arrays is 2 then use below formula to get
  the median.
q
    Median = (max(ar1[0], ar2[0]) + min(ar1[1], ar2[1]))/2
Example:

   ar1[] = {1, 12, 15, 26, 38}
   ar2[] = {2, 13, 17, 30, 45}
For above two arrays m1 = 15 and m2 = 17

For the above ar1[] and ar2[], m1 is smaller than m2. So median is present in one of the following two subarrays.

   [15, 26, 38] and [2, 13, 17]
Let us repeat the process for above two subarrays:

    m1 = 26 m2 = 13.
m1 is greater than m2. So the subarrays become

  [15, 26] and [13, 17]
Now size is 2, so median = (max(ar1[0], ar2[0]) + min(ar1[1], ar2[1]))/2
                       = (max(15, 13) + min(26, 17))/2
                       = (15 + 17)/2
                       = 16

# when u recurse, u search kth then k/2 th , then k/4 ...

###########################################
# longest repeated substring
#
Algorithm 1: This is perhaps the most naïve algorithm:

MaxL=MaxR=maxLength=0
For L = 1 to n do
               For R = 1 to n do
                     Determine the longest k such A[L]A[L+1]…A[L+k-1] = A[R]A[R+1]…A[R+k-1]
                     If k>maxLength then maxL=L, maxR=R and maxLength=Length


Algorithm 2: longest repeated substring - a sorting solution.

http://cs.fit.edu/~ryan/cse1002/sedgewick/42sort.pdf	slide:38

-Given a string , save all of its suffixes
- sort the suffixes
- the repeated substring will occure adjacent
- just calculate the max. prefix length


###########################################
# for maximum contiguous product, if no. of negative nos. is even , no problem.
# if their no. is odd, you have to leave one of the -ve no. which is at the boundary ....
# u have to callculate which -ve no. to leave so that u get bigger prodcut.
# initially partition acroos zero elements
http://rajeevprasanna.blogspot.com/2011/07/maximum-contiguous-product-in-array.html
###########################################
# max contiguous sum
# for eg. ... 1, -3, 4, -2, -1, 6

# start iteam for var m in code below will always be at tail or start for that contiguous sequenece
#
	public int maxSum(int[] a) {
		int m = 0;
		int msuf = 0;
		// Invariant: m is the maximum subsequence sum for a[0..i-1],
		//            msuf is the maximum suffix sum for a[0..i-1]
		for (int i = 0; i < a.length; i++) {
			msuf = Math.max(0, msuf + a[i]);
			m = Math.max(m, msuf);
		}
		return m;
	}

# Tested code to report positions too:

int maxSum (int a[], int length)
{
    int m = 0;
    int m_st=0, m_end=0;
    int msuf = 0;
    int msuf_st=0, msuf_end=0;
    // Invariant: m is the maximum subsequence sum for a[0..i-1],
    //            msuf is the maximum suffix sum for a[0..i-1]

    for (int i = 0; i < length; i++) {
      if (0 < msuf + a[i]) {
        msuf_end = i;
        msuf = msuf + a[i];
      }
      else {
        msuf = 0;
        msuf_st = i+1;  // anticipate that next will be +ve
        msuf_end = i+1;
      }
      if (m < msuf) {
        m_st = msuf_st;
        m_end = msuf_end;
        m = msuf;
      }
    }
      printf ("\n pointers = %d || %d ", m_st, m_end);
      printf ("\n final = %d", m);

    return m;
}


###########################################
# a divide conquer approach to above:
#
	private int maxSum(int[] a, int lo, int hi) {
		if (lo == hi) return Math.max(0, a[lo]);
		else {
			int mid = (lo + hi)/2;
			int mid1 = mid + 1;
			int sum1 = maxSum(a, lo, mid);
			int sum2 = maxSum(a, mid1, hi);
			int sum3 = maxSuffix(a, lo, mid) + maxPrefix(a, mid1, hi);
      /*do this for sequence 6, -8, -2, 5*/
			return Math.max(Math.max(sum1, sum2), sum3);
		}
	}

	/**
	 * Computes the maximum suffix sum of a[lo..hi]. It must be the case that
	 * lo <= hi.
	 *
	 * @param a  The array over which the maximum suffix sum is to be found.
	 * @param lo The index of the first element of the segment considered.
	 * @param hi The index of the last element of the segment considered.
	 * @return   The maximum suffix sum of a[lo..hi].
	 */
	private int maxSuffix(int[] a, int lo, int hi) {
		int m = 0;
		// Invariant: m is the maximum suffix sum for a[lo..i-1]
		for (int i = lo; i <= hi; i++) {
			m = Math.max(0, m + a[i]);
		}
		return m;
	}

	/**
	 * Computes the maximum prefix sum of a[lo..hi]. It must be the case that
	 * lo <= hi.
	 *
	 * @param a  The array over which the maximum prefix sum is to be found.
	 * @param lo The index of the first element of the segment considered.
	 * @param hi The index of the last element of the segment considered.
	 * @return   The maximum prefix sum of a[lo..hi].
	 */
	private int maxPrefix(int[] a, int lo, int hi) {
		int m = 0;
		// Invariant: m is the maximum prefix sum for a[i+1..hi]
		for (int i = hi; i >= lo; i--) {
			m = Math.max(0, m + a[i]);
		}
		return m;
	}


###########################################
# reference to a pointer

Star mark then amp.

void func(int*& rpInt);

###########################################
# code to add n+1 w/o using any of plus/minus etc. operators
#
# vkc method: for odd, the last bit swaps, then 2nd last bit swaps if that is 1, 3rd last also swaps if that is 1, .... so on.
#
public static int inc(int value){

		// even value
		if( isEven(value) ){
			return value | 1;
		}

		// odd value
		int mask = 1;
		while( (value & mask) != 0 ){
			value &= ~(mask);
			mask <<= 1;
		}

		value |= mask;

		return value;
	}

###########################################

# roman to decimal
private int toInt(char c)
{
switch (c) {
    case 'I': return 1;
    case 'V': return 5;
    case 'X': return 10;
    case 'L': return 50;
    case 'C': return 100;
    case 'D': return 500;
    case 'M': return 1000;
    default: return 0;
    }
}
public int calc(char[] input)
{
    int total = 0;
    int previous = 0;
    // no previous digit handled
    for (int i = input.length - 1; i >= 0; i--)
    {
        int current = toInt(input[i]);
        int sign = (current < previous) ? -1 : 1;
        previous = current;
        total += sign * current;
    }
    return total;
}

###########################################
Find the kth smallest element in a bst.

# 1st method:
You can use iterative inorder traversal:
http://en.wikipedia.org/wiki/Tree_traversal#Iterative_Traversal with a simple check for kth element after poping a node out of the stack.

#2nd meohtod

void findK(Node* p, int& k) {
	// note k is a ref.
  if(!p || k < 0) return;
  findK(p->left, k);
  --k;
  if(k == 0) {
    print p->data;
    return;
  }
  findK(p->right, k);
}

# if u want to find the kth largest, u move first right and do 'visit' stuff and then left
#

###########################################
# GCD
#
complexity = if a>b ... if we can show that after 2 iterations, the remainder decresses to half of its value..

its sufficient to prove that, a mod b < a/2

if b < a/2, then clearaly, a mod b < b < a/2

if b > a/2 , then a/b = 0, a % b = x < a/2

function gcd(a, b)
{

while b ? 0
{
t := b
b := a mod b
a := t
}
return a
}

Using Recursion
function gcd(a, b)
{

if b = 0 return a
else return gcd(b, a mod b)
}


###########################################
# helical matrix / spiral
#
# 2. method

#include <stdio.h>
void print_layer_top_right(int a[][4], int x1, int y1, int x2, int y2);
void print_layer_bottom_left(int a[][4], int x1, int y1, int x2, int y2);

int main(void)
{
       int a[5][4] = {
                       {1,2,3,4},
                       {5,6,7,8},
                       {9,10,11,12},
                       {13,14,15,16},
                       {17,18,19,20}
                   };

       print_layer_top_right(a,0,0,3,4);
}

//
// prints the top and right shells of the matrix
//
void print_layer_top_right(int a[][4], int x1, int y1, int x2, int y2)
{
      int i = 0, j = 0;

      // print the row
      for(i = x1; i<=x2; i++)
      {
         printf("%d,", a[y1][i]);
      }

      //print the column
      for(j = y1 + 1; j <= y2; j++)
      {
         printf("%d,", a[j][x2]);
      }

      // see if  we have more cells left
      if(x2-x1 > 0)	// this checks the if ther is any column spacing
      {
          // 'recursively' call the function to print the bottom-left layer
          print_layer_bottom_left(a, x1, y1 + 1, x2-1, y2);
      }
}

//
// prints the bottom and left shells of the matrix
//
void print_layer_bottom_left(int a[][4], int x1, int y1, int x2, int y2)
{
       int i = 0, j = 0;

       //print the row of the matrix in reverse
       for(i = x2; i>=x1; i--)
       {
               printf("%d,", a[y2][i]);
       }

       // print the last column of the matrix in reverse
       for(j = y2 - 1; j >= y1; j--)
       {
               printf("%d,", a[j][x1]);
       }

       if(x2-x1 > 0)	// this also check if there is column spacing
       {
               // 'recursively' call the function to print the top-right layer
               print_layer_top_right(a, x1+1, y1, x2, y2-1);
       }
}

############## 1. method
/* HELICAL MATRIX */

int main()
{
int arr[][4] = { {1,2,3,4},
{5,6,7,8},
{9,10,11,12},
{13, 14, 15, 16}
};

int i, j, k,middle,size;
printf("\n\n");
size = 4;

for(i=size-1, j=0; i > 0; i--, j++)
{
for(k=j; k < i; k++) printf("%d ", arr[j][k]);
for(k=j; k < i; k++) printf("%d ", arr[k][i]);
for(k=i; k > j; k--) printf("%d ", arr[i][k]);
for(k=i; k > j; k--) printf("%d ", arr[k][j]);
}

middle = (size-1)/2;
if (size % 2 == 1) printf("%d", arr[middle][middle]);
printf("\n\n");
return 1;


###########################################
# lexiographic questions
http://www.ihas1337code.com/2010/10/amazon-bar-raiser-interview-question.html

#1
string numToStr(int n) {
  string str(1, 'a' + n%26);
  n = n/26;
  while (n != 0) {
    str = (char)('a' + (n-1)%26) + str;
    n = (n-1)/26;
  }
  return str;
}

#2
void numToStrHelper(int n) {
  if (n == 0) return;
  numToStrHelper((n-1)/26);
  cout << (char)('a'+(n-1)%26);
}

void numTostr(int n) {
  numToStrHelper(n/26);
  cout << (char)('a'+n%26);
}

###########################################
# convert sorted  link list to bst	(bottom up)
# same to : convert sorted doubly link list to bst

BinaryTree* sortedListToBST(ListNode *& list, int start, int end) {
  if (start > end) return NULL;
  // same as (start+end)/2, avoids overflow
  int mid = start + (end - start) / 2;
  BinaryTree *leftChild = sortedListToBST(list, start, mid-1);
  BinaryTree *parent = new BinaryTree(list->data);
  parent->left = leftChild;
  list = list->next;
  parent->right = sortedListToBST(list, mid+1, end);
  return parent;
}

BinaryTree* sortedListToBST(ListNode *head, int n) {
  return sortedListToBST(head, 0, n-1);
}

# covert a sorted array to bst, divide conquer:

BinaryTree* sortedArrayToBST(int arr[], int start, int end) {
  if (start > end) return NULL;
  // same as (start+end)/2, avoids overflow.
  int mid = start + (end - start) / 2;
  BinaryTree *node = new BinaryTree(arr[mid]);
  node->left = sortedArrayToBST(arr, start, mid-1);
  node->right = sortedArrayToBST(arr, mid+1, end);
  return node;
}

BinaryTree* sortedArrayToBST(int arr[], int n) {
  return sortedArrayToBST(arr, 0, n-1);
}


###########################################
# A sorted doubly linked list is created from bst in O(n) time

# mtd 1: http://www.ihas1337code.com/2010/11/convert-binary-search-tree-bst-to.html

// This is a modified in-order traversal adapted to this problem.
// prev (init to NULL) is used to keep track of previously traversed node.
// head pointer is updated with the list's head as recursion ends.'
void treeToDoublyList(Node *p, Node *& prev, Node *& head) {
  if (!p) return;
  treeToDoublyList(p->left, prev, head);
  // current node's left points to previous node
  p->left = prev;
  if (prev)
    prev->right = p;  // previous node's right points to current node
  else
    head = p; // current node (smallest element) is head of
              // the list if previous node is not available
  // as soon as the recursion ends, the head's left pointer
  // points to the last node, and the last node's right pointer
  // points to the head pointer.
  Node *right = p->right;
  head->left = p;
  p->right = head;
  // updates previous node
  prev = p;
  treeToDoublyList(right, prev, head);
}

// Given an ordered binary tree, returns a sorted circular
// doubly-linked list. The conversion is done in-place.
Node* treeToDoublyList(Node *root) {
  Node *prev = NULL;
  Node *head = NULL;
  treeToDoublyList(root, prev, head);
  return head;
}

# mtd 2:

- For each node in the bst the left is made to point to previous element in dll and right is made to point to next element in dll.
- Flag is used to keep track if a node is left child or right child of parent.
- function call on left subtree returns rightmost child and viceversa.
- Finally the first function call returns the first element in dll.

node * Tree :: convLnLst(node *T,int flag=-1){
	node *l1,*l2;

	if(T!=NULL){
		l1=convLnLst(T->left,0);
		l2=convLnLst(T->right,1);

		T->left=l1;
		T->right=l2;

		if(l1!=NULL){
			l1->right=T;
		}

		if(l2!=NULL){
			l2->left=T;
		}
		#if(flag==0 && T->right)
		#	return T->right;
		if (flag == 0) {
			while (T->right)
				T = T->right;
			return T;
		}

		#if(flag==1 && T->left)
		#	return T->left;
		if (flag == 1) {
			while (T->left)
				T = T->left;
			return T;
		}

		if(flag==-1){
			while(T->left)
				T=T->left;
		}

	}
	return T;
}

# 2nd method by stan:
#	http://cslibrary.stanford.edu/109/TreeListRecursion.html
#

/*
 helper function -- given two list nodes, join them
 together so the second immediately follow the first.
 Sets the .next of the first and the .previous of the second.
*/
static void join(Node a, Node b) {
    a->large = b;
    b->small = a;
}

/*
 helper function -- given two circular doubly linked
 lists, append them and return the new list.
*/
static Node append(Node a, Node b) {
    Node aLast, bLast;

    if (a==NULL) return(b);
    if (b==NULL) return(a);

    aLast = a->small;
    bLast = b->small;

    join(aLast, b);
    join(bLast, a);

    return(a);
}

/*
 --Recursion--
 Given an ordered binary tree, recursively change it into
 a circular doubly linked list which is returned.
*/
static Node treeToList(Node root) {
    Node aList, bList;

    if (root==NULL) return(NULL);

    /* recursively solve subtrees -- leap of faith! */
    aList = treeToList(root->small);
    bList = treeToList(root->large);

    /* Make a length-1 list ouf of the root */
    root->small = root;
    root->large = root;

    /* Append everything together in sorted order */
    aList = append(aList, root);
    aList = append(aList, bList);

    return(aList);
}



###########################################'
# k-way merge
#
else {
    // divide the array into k subarrays and do a k-way merge
    final int subarrSize = high-low+1;
    final int[] tempArray = new int[subarrSize];

    // Make temp array
    for (int i = low; i < high + 1; i++)
        tempArray[i-low] = data[i];

    // Keep subarray index to keep track of where we are in each subarray
    final int[] subarrayIndex = new int[k];
    for (int i = 0; i < k; i++)
        subarrayIndex[i] = i*(subarrSize)/k;

    // Build heap
    Comparable[] subarray = new MergesortHeapNode[k];
    for (int i = 0; i < k; i++)
        subarray[i] = new MergesortHeapNode(tempArray[subarrayIndex[i]++], i);

    BinaryHeap heap = BinaryHeap.buildHeap(subarray);

    // For each element low to high, find the lowest in each k subarray
    for (int i = low; i < high + 1; i++)
    {

        // Take lowest element and add back in to original array
        try
        {
            MergesortHeapNode a = ((MergesortHeapNode) heap.deleteMin());
            data[i] = a.getKey();
            if (subarrayIndex[a.getWhichSubarray()] < (a.getWhichSubarray()+1)*(subarrSize)/k)
            {
                heap.insert(
			new MergesortHeapNode(
				tempArray[subarrayIndex[a.getWhichSubarray()]]++, a.getWhichSubarray()
			));

                // Increment the subarray index where the lowest element resides
                subarrayIndex[a.getWhichSubarray()]++;
            }
        } catch (EmptyHeapException e)
        {
            System.out.println ("Tried to delete from an empty heap.");
        }
    }
}
'
'


###########################################
#parking design:
#
ParkingLot is a class.

ParkingSpace is a class.

ParkingSpace has an Entrance.

Entrance has a location or more specifically, distance from Entrance.

ParkingLotSign is a class.

ParkingLot has a ParkingLotSign.

ParkingLot has a finite number of ParkingSpaces.

HandicappedParkingSpace is a subclass of ParkingSpace.

RegularParkingSpace is a subclass of ParkingSpace.

CompactParkingSpace is a subclass of ParkingSpace.

ParkingLot keeps array of ParkingSpaces, and a separate array of vacant ParkingSpaces in order of distance from its Entrance.

ParkingLotSign can be told to display "full", or "empty", or "blank/normal/partially occupied" by calling .Full(), .Empty() or .Normal()

Parker is a class.

Parker can Park().

Parker can Unpark().

Valet is a subclass of Parker that can call ParkingLot.FindVacantSpaceNearestEntrance(), which returns a ParkingSpace.

Parker has a ParkingSpace.

Parker can call ParkingSpace.Take() and ParkingSpace.Vacate().

Parker calls Entrance.Entering() and Entrance.Exiting() and ParkingSpace notifies ParkingLot when it is taken or vacated so that ParkingLot can determine if it is full or not. If it is newly full or newly empty or newly not full or empty, it should change the ParkingLotSign.Full() or ParkingLotSign.Empty() or ParkingLotSign.Normal().

HandicappedParker could be a subclass of Parker and CompactParker a subclass of Parker and RegularParker a subclass of Parker. (might be overkill, actually.)

In this solution, it is possible that Parker should be renamed to be Car.


###########################################

# majority algorithm
# http://www.cs.utexas.edu/~moore/best-ideas/mjrty/example.html
#
We will sweep down the sequence starting at the pointer position shown above.

As we sweep we maintain a pair consisting of a current candidate and a counter. Initially, the current candidate is unknown and the counter is 0.

When we move the pointer forward over an element e:

If the counter is 0, we set the current candidate to e and we set the counter to 1.
If the counter is not 0, we increment or decrement the counter according to whether e is the current candidate.
When we are done, the current candidate is the majority element, if there is a majority.


###########################################
# make a stack with min/max/push/pop in O(1) time
#
# use two extra stacks to store min and max at every level

public class MinMaxStack extends Stack{
Stack min = new Stack();
Stack max = new Stack();

public object pop(){
return super.pop();
min.pop();max.pop();
}

public void push(object){
super.push(object);

if(min.peek()>=object) min.push(object);
else min.push(min.peek());

if(max.peek()<=object) max.push(object);
else max.push(max.peek());
}

public object min(){
return min.pop();
}
public object max(){
return max.pop();
}
}

###########################################
# from inorder and level order
# call like:

#	Tree::levelorderTraversal(Tree::createTreeFromLevelOrder(inorder,levelorder,0,len-1,1));

static TreeNode* createTreeFromLevelOrder(int inorder[],int levelorder[], int start, int end,int level)
    {
        if(start>end)
        {
            return NULL;
        }
        TreeNode* temp = new TreeNode();
        temp->value = levelorder[level-1];
        if(start==end)
        {
            return temp;
        }
        int mid = search(inorder,start,end,temp->value);
        temp->left = createTreeFromLevelOrder(inorder,levelorder,start, mid-1,2*level);
        temp->right = createTreeFromLevelOrder(inorder,levelorder,mid+1,end,2*level+1);
        return temp;
    }

	    static int search(int x[],int start, int end,char value)
	    {
	        for(int i=start; i<end; i++)
	        {
	            if(x[i]==value)
	            {
	                return i;
	            }
	        }
	    }


###########################################


# construct binary tree from inorder and preorder
#
struct node* buildTree(char in[], char pre[], int inStrt, int inEnd)
{
  static int preIndex = 0;
  # static int preIndex = end;		// if u want to do for postOrder
 
  if(inStrt > inEnd)
     return NULL;
 
  /* Pick current node from Preorder traversal using preIndex
    and increment preIndex */
  struct node *tNode = newNode(pre[preIndex++]);
 
  /* If this node has no children then return */
  if(inStrt == inEnd)
    return tNode;
 
  /* Else find the index of this node in Inorder traversal */
  int inIndex = search(in, inStrt, inEnd, tNode->data);
 
  /* Using index in Inorder traversal, construct left and
     right subtress */
  tNode->left = buildTree(in, pre, inStrt, inIndex-1);
  tNode->right = buildTree(in, pre, inIndex+1, inEnd);
 
  return tNode;
}
 
/* UTILITY FUNCTIONS */
/* Function to find index of value in arr[start...end]
   The function assumes that value is present in in[] */
int search(char arr[], int strt, int end, char value)
{
  int i;
  for(i = strt; i <= end; i++)
  {
    if(arr[i] == value)
      return i;
  }
}
 

###########################################
void inOrderIterative(TREEPTR tree){

	STACKPTR stackTop = NULL;

	TREEPTR current = tree;

	do{
		while(current!=NULL){
			pushStack(&stackTop,(void *)current);
			current=current->left;
		}

		if(!isEmptyStack(stackTop)){
			current = popStack(&stackTop);
			printf("\n%d", current->info);
			current=current->right;
		}
	}while(!isEmptyStack(stackTop) || current!=NULL);
}


# appealing:
#
   bool done;
   binary_tree_node<Item> *root_ptr, *cursor;
   stack<binary_tree_node<Item> *> s;

   cursor = root_ptr;             //set cursor to root of binary tree
   done = false;

   while (!done)
   {
      if(cursor != NULL)
      {
         s.push(cursor);          //place pointer to node on the stack
                                  //before traversing the node's left subtree'
         cursor = cursor->left(); //traverse the left subtree
      }
      else                        //backtrack from the empty subtree and
                                  //visit the node at the top of the stack;
                                  //however, if the stack is empty, you are
                                  //done
      {
         if (!s.empty())
         {
             cursor = s.top();
	           s.pop();
             cout << cursor->data();
             cursor = cursor->right();
         }
         else
             done = true;
      }
   }

'
# '
###########################################

void preOrderIterative(TREEPTR tree){

	STACKPTR stackTop = NULL;

	TREEPTR current = tree;

	do{
		while(current!=NULL){
			printf("\n%d", current->info);
			pushStack(&stackTop,(void *)current->right);
			current=current->left;
		}

		if(!isEmptyStack(stackTop)){
			current = popStack(&stackTop);
		}
	}while(!isEmptyStack(stackTop) || current!=NULL);
}

# apeealing version

void preIter (node *n) {
	Stack s<node*>;
	node *curr = n;
	if (!curr) return;

	while (1) {
		while (curr) {
			cout << curr->Data;
			s.push (curr->rC);
			curr = curr->lc;
		}
		if (!s.isempty () ) {
			curr = S.pop();
      cout << curr->data;
    }
		else
			break;
	}
}

###########################################
# very simple ... upside down of pre-orders
#
void PostOrder(struct node *T)
{
	struct node *temp=T;
	stack *s1=NULL,*s2=NULL;
	if(temp==NULL)
		return;
	Push(temp,s1);
	while(!isEmpty(s1))
	{
		temp=Pop(s1);
		Push(temp,s2);
		if(temp->left)
			Push(temp->left,s1);
		if(temp->right)
			Push(temp->right,s1);
	}
	while(!isEmpty(s2))
		printf("%d",(Pop(s2))->data);
}

###########################################

void postOrderIterative(TREEPTR tree){

	STACKPTR stackTop = NULL;

	TREEPTR current = tree;

	do{
		while(current!=NULL){
			pushStack(&stackTop,current);
			current=current->left;
		}
		if(!isEmptyStack(stackTop)){
			current=popStack(&stackTop);
			if(current->right==NULL){
				printf("\n%d",current->info);
				current=current->right;
			}
			else{
				if(current->isVisited==true){
					printf("\n%d",current->info);
					current=NULL;
				}else{
					current->isVisited=true;
					pushStack(&stackTop,current);
					current=current->right;
				}
			}
		}
	}while(!isEmptyStack(stackTop) || current!=NULL);

}
###########################################

# Postorder without visited flag:

public static String postOrderNoflag(Node root) {
    String s = "";
    Stack<Node> stack = new Stack<Node>();
    Node last = null;
    Node cur = root;
    stack.push(root);
    while (!stack.isEmpty()) {
        while (cur != null) {
            if (cur.left_ != null) {
                cur = cur.left_;
                stack.push(cur);
            }else{
                break; //break loop
            }
        }
        cur = stack.peek();
        if (cur.right_ != null && last != cur.right_) {
            cur = cur.right_;
            stack.push(cur);
        } else {
            stack.pop();
            s += cur.value_+", ";
            last = cur;
            cur = null;
        }

    }
    return s;
}

Variable "last" record the latest popped up node. If a node has a right node, the latest popped node must be current node's right node. Therefore use last could check whether current's right node visited or not. Thanks konna.


###########################################
topological sort:

E:\My eBooks\Algo\Sahni Codes\all\network.h
	- steps:
		- compute in-degree
		- stack 0 in-degress vertices
		- find topo order

# another trick is to start dfs(v) from a random node v , and the end of dfs(v) insert v into a list L
# list of the nodes in descending order of finish nos. gives the topological order.
#
###########################################

# cicular sorted array search:

# mtd 1
int rotated_binary_search(int A[], int N, int key) {
  int L = 0;
  int R = N - 1;

  while (L <= R) {
    // Avoid overflow, same as M=(L+R)/2
    int M = L + ((R - L) / 2);
    if (A[M] == key) return M;

    // the bottom half is sorted
    if (A[L] <= A[M]) {
      if (A[L] <= key && key < A[M])
        R = M - 1;
      else
        L = M + 1;
    }
    // the upper half is sorted
    else {
      if (A[M] < key && key <= A[R])
        L = M + 1;
      else
        R = M - 1;
    }
  }
  return -1;



public int rotatedSearch(int[] values, int start, int end,
                          int x){
    if(values[start] == x){
        return start;
    } else if(values[end] == x){
        return end;
    } else if(end - start == 1) {
        return -1;
    }
    int middle = (start + end) / 2;

    if(values[start] <= values[middle]){
        if(x <= values[middle] && x >= values[start]){
            return rotatedSearch(values, start, middle, x);
        } else {
            return rotatedSearch(values, middle, end, x);
        }
    } else if(values[middle] <= values[end]){
        if(x >= values[middle] && x <= values[end] ){
            return rotatedSearch(values, middle, end, x);
        } else {
            return rotatedSearch(values, start, middle, x);
        }
    } else {
        return -1;
    }
}

# see "find_inflection.cpp" in hg-repo
#
*
http://www.mytechinterviews.com/search-in-a-sorted-circular-array

http://groups.google.com/group/algogeeks/browse_thread/thread/e351d9d5d3ac17db?pli=1

http://homeofcox-cs.blogspot.com/2010/04/search-in-circular-sorted-array.html

http://programmingproblems.blogspot.com/2006/08/searching-circularly-sorted-array.html

http://stackoverflow.com/questions/2834652/seaching-for-an-element-in-a-circular-sorted-array

iterative traversals

http://www.careercup.com/page?pid=amazon-interview-questions


###########################################
Recursive Inorder: Tail recursion

void Inorder(struct node *root) {
	if(!root) return;
		Inorder(root->left);
		ProcessNode(root);
		Inorder(root->right);
	}

Removing tail recursion - Inorder

# Tail calls are significant because they can be implemented without adding a new stack frame to the call stack. Most of the frame of the current procedure is not needed any more, and it can be replaced by the frame of the tail call, modified as appropriate (similar to overlay for processes, but for function calls). The program can then jump to the called subroutine. Producing such code instead of a standard call sequence is called tail call elimination, or tail call optimization.

# Example here: http://stackoverflow.com/questions/33923/what-is-tail-recursion

void Inorder(struct node *root) {
while(root) {
	Inorder(root->left);
	ProcessNode(root);
	root = root->right;
	}
}


###########################################
Towers of hanoi N, K pegs

http://tristan-interview.blogspot.com/2012/02/n-disks-and-k-pegs-extension-problem-of.html

###########################################
/* Strategy: consider that each value could be the root.
 Recursively find the size of the left and right subtrees.
*/
int countTrees(int numKeys) {

  if (numKeys <=1) {
    return(1);
  }
  else {
    // there will be one value at the root, with whatever remains
    // on the left and right each forming their own subtrees.
    // Iterate through all the values that could be the root...
    int sum = 0;
    int left, right, root;

    for (root=1; root<=numKeys; root++) {
      left = countTrees(root - 1);
      right = countTrees(numKeys - root);

      // number of possible trees with this root == left*right
      sum += left*right;
    }

    return(sum);
  }
}

###########################################
/*	return : 	1 little endian
			0 big endiean	*/

# mtd 1
	int i = 1;
	char *c = (char *) &i
  printf ("\n [%d]" , *c);  

# mtd 2
	int test () {
		union {
		int theinteger;
		char singlebyte;
		} endiantest;

		endiantest.theinteger = 1;
		return endiantest.singlebyte;
	}
###########################################
cycle in a linked list:

int cyclePresent (node *head) {
	node *fast, *slow;
	fast = head;
	slow = head;

	while (1) {
		// if end of list
		if (!fast || !fast->next)
			return 0;
		// if in cycle
		if (fast == slow || fast->next == slow)
			return 1;
		else {
			fast = fast->next->next;
			slow = slow->next;
		}
	}
}

###########################################

bool Network::findPath(int v, int w, int &length, int path[], int reach[])
{// Actual path finder v != w.
 // Performs a depth-first search for a path to w.
   reach[v] = 1;
   int u = Begin(v);
   while (u) {
      if (!reach[u]) {
         length++;
         path[length] = u; // add u to path
         if (u == w) return true;
         if (findPath(u, w, length, path, reach))
            return true;
         // no path from u to w
         length--; // remove u
         }
      u = NextVertex(v);}
   return false;
}

###########################################
# if mouse is allowed to go down, right only ... where no. of paths with all open cells = (n+m)! / n!m!

Part 2: Psuedo-code

bool is_free(int x, int y) { // return true if we can move here };
global current_path;

void print_paths(int x, int y) {
  current_path.ADD( pair(x, y) );
  if (0 == x && 0 == y) {
    print current_path();
    return;
  }
  if (x > 1 && is_free(x - 1, y)) {
    print_paths(x - 1, y);
  }
  if (y > 1 && is_free(y - 1, x)) {
    print_paths(y - 1, 1);
  }
  current_path.REMOVE(path(x, y);
}


###########################################
bool Network::Topological(int v[])
{// Compute topological ordering of digraph vertices.
 // Return true if a topological order is found.
 // In this case return the order in v[0:n-1].
 // Return false if there is no topological order.

   int n = Vertices();

   // Compute in-degrees
   int *InDegree = new int [n+1];
   InitializePos(); // graph iterator array
   for (int i = 1; i <= n; i++) // initialize
      InDegree[i] = 0;
   for (i = 1; i <= n; i++) {// edges out of i
      int u = Begin(i);
      while (u) {
         InDegree[u]++;
         u = NextVertex(i);}
      }

   // Stack vertices with zero in-degree
   LinkedStack<int> S;
   for (i = 1; i <= n; i++)
      if (!InDegree[i])  
          S.Add(i);

   // Generate topological order
   i = 0;  // cursor for array v
   while (!S.IsEmpty()) {// select from stack
      int w;             // next vertex
      S.Delete(w);
      v[i++] = w;
      int u = Begin(w);
      while (u) {// update in-degrees
         InDegree[u]--;
         if (!InDegree[u]) S.Add(u);
         u = NextVertex(w);}
      }

   DeactivatePos();
   delete [] InDegree;
   return (i == n);
}

###########################################
void Network::dfs(int v, int reach[], int label)
{
	// Actual depth-first search code.
   reach[v] = label;
   int u = Begin(v);
   while (u) {
	   // u is adj to v
      if (!reach[u])
        dfs(u, reach, label);
      u = NextVertex(v);
	}
}

# using STACK:  mtd: 1

DFS(G,v)   ( v is the vertex where the search starts )
         Stack S := {};   ( start with an empty stack )
         for each vertex u, set visited[u] := false;
         push S, v;
         while (S is not empty) do
            u := pop S;
            if (not visited[u]) then
               visited[u] := true;
               for each unvisited neighbour w of u
                  push S, w;
            end if
         end while
END DFS()

# mtd 2:  http://www.cs.mcgill.ca/~pnguyen/251F09/DFS.pdf
          important thing is that they use 2 functions to achieve that ...


###########################################
void Network::BFS(int v, int reach[], int label)
{// Breadth first search.
   LinkedQueue<int> Q;
   InitializePos(); // init graph iterator array
   reach[v] = label;
   Q.Add(v);
   while (!Q.IsEmpty()) {
      int w;
      Q.Delete(w);  // get a labeled vertex
      int u = Begin(w);
      while (u) {// visit adj vertices of w
         if (!reach[u]) {// an unreached vertex
            Q.Add(u);
            reach[u] = label;} // mark reached
         u = NextVertex(w); // next adj vertex of w
         }
      }
   DeactivatePos(); // free iterator array
}

###########################################

Graphs:

DFS / BFS space/time cplz. same.	O ( v+e)

#Finding cycle in a graph .
	check in copy

#For finding if a Undir - graph is connected:

	do a dfs/bfs from any vertex and verify that all vertices reached == n
	i.e. in the reach[] check for each entry	Pg. 609

	DFS (1, reach[] , label=1);
	check for any values which are NOT 1 in value of reach[j] ..... those vertices are not reachable

	For Directed Graph:	// 'TODO '??''

	for (i=1 to Vertices () ) {

	}

# label graph components:
	do a BFS with label having incremental values over diff. runs of BFS:

	for ( i=1 to Vertices() )
		if (L[i] ! reached ) {
		BFS (vertex n, L[] , label)
		label++; }

# DspanTree (i, DT)

	void undirected-dSPantree (int i, DT [][]) {
		label = 1;
		reach [n] ={0};
		reach [i] = label;

		dfs (i, reach, DT);
	}
	void dfs (int i, int *reach, int label, DT[][]) {
		reach[i] = label;
		int u = Begin (i);
		while (!reach[u]) {
			DT[i][u] = EDGE;
			dfs (u, reach, label, DT);
		}
		u = Next();
	}

# Prog. for longest Palindrome

	http://stevekrenzel.com/articles/longest-palnidrome
	Take 2 pointers in a string. lower/upper
	lower-- , upper++
	if (str[lower] == str[upper]) { lower--, upper++; } else { take down the largest palin. seen for that position }

	Move to next character.

	Best case = O(n)	No palindromes in string.
	Worst case = O(n2)	String like "aaaaaaaaa"

  string expandAroundCenter(string s, int c1, int c2) {
    int l = c1, r = c2;
    int n = s.length();
    while (l >= 0 && r <= n-1 && s[l] == s[r]) {
      l--;
      r++;
    }
    return s.substr(l+1, r-l-1);
  }

    string longestPalindromeSimple(string s) {
      int n = s.length();
      if (n == 0) return "";
      string longest = s.substr(0, 1);  // a single char itself is a palindrome
      for (int i = 0; i < n-1; i++) {
        string p1 = expandAroundCenter(s, i, i);
        if (p1.length() > longest.length())
          longest = p1;

        string p2 = expandAroundCenter(s, i, i+1);
        if (p2.length() > longest.length())
          longest = p2;
      }
      return longest;
    }


###########################################

uint swapBits(uint x, uint i, uint j) {
  uint lo = ((x >> i) & 1);
  uint hi = ((x >> j) & 1);
  if (lo ^ hi) {
    x ^= ((1U << i) | (1U << j));
  }
  return x;
}
 
uint reverseXor(uint x) {
  uint n = sizeof(x) * 8;
  for (uint i = 0; i < n/2; i++) {
    x = swapBits(x, i, n-i-1);
  }
  return x;
}
Reverse bits O(n)

Better here @ 
http://www.leetcode.com/2011/08/reverse-bits.html 
###########################################

http://www.leetcode.com/2011/09/regular-expression-matching.html
REGEX dfa matching

    bool isMatch(const char *s, const char *p) {
      assert(s && p);
      if (*p == '\0') return *s == '\0';
     
      // next char is not '*': must match current character
      if (*(p+1) != '*') {
        assert(*p != '*');
        return ((*p == *s) || (*p == '.' && *s != '\0')) && isMatch(s+1, p+1);
      }
      // next char is '*'
      while ((*p == *s) || (*p == '.' && *s != '\0')) {
        if (isMatch(s, p+2)) return true;
        s++;
      }
      return isMatch(s, p+2);
    }

###########################################

###########################################
Greedy-fractional-knapsack (w, v, W)

    FOR i =1 to n
        do x[i] =0
    weight = 0
    while weight < W
        do i = best remaining item
            IF weight + w[i] = W
                then x[i] = 1
                    weight = weight + w[i]
                else
                    x[i] = (W - weight) / w[i]
                    weight = W
    return x

###########################################

look at some dynamic programming code	<todo>
	look in copy

# coin denonimation problem: Return min. no. of coins which can give u 'amount' Rs. with infinite repetion
# complexity = nW
# W is the width or max. amt. of weight a knapsack can have
	# infinite supply of coins
#####
int coins( int[] coins, int amount ) {
	int[] table = new int[amount+1];

Arrays.fill( table, Integer.MAX_VALUE - 100 );
	table[0] = 0;

for ( int i = 1; i < table.length; i++ ) {
		for ( int j = 0; j < coins.length; j++ ) {
			if ( coins[j] <= i && table[i - coins[j]] + 1 < table[i] ) {
                            table[i] = table[i - coins[j]] + 1;
                        }
                }
        }
return table[amount];
}

Towards a recurrence relation for making change

# Explanation

#   For dynamic programming to work, one needs a recurrence relation for the optimized objective function

#   Now analyze what the optimal way to make change is if denominations 1...i are allowed ( as opposed to just 1...i-1):

#   Case 1. You don't use any tokens ("coins") of the largest denomination:
#	then the optimal number of tokens is just c(i-1,j)

#   Case 2. You do use tokens of the largest denomination d(i):
#	then the optimal number of tokens is 1 + c(i,j-d(i))

#	*notice that the right-hand side allows d(i) to be used again*

#   The minimum number of tokens is the best you can do across both cases

#   The recurrence relation is therefore:

#      c(i,j) = min( c(i-1,j), 1 + c(i,j-d(i)) )

###########################################
# coin change with infinite repetition	good
http://www.ccs.neu.edu/home/jaa/CSG713.04F/Information/Handouts/dyn_prog.pdf

###########################################

http://www.ics.uci.edu/~eppstein/161/960109.html

a fast algo. for fibbonaci using matrix multiplication.

Algorithm 5:

------------------------
Now, we have a useful way of describing the fibonacci function:

-      - ^n        -                                -
| 0  1 |      =    | fibonacci(n-1)   fibonacci(n)  |
| 1  1 |           |  fibonacci(n)   fibonacci(n+1) |
-      -           -                                -

That is, the matrice on the left (with the ones and zero) when multiplied by itself n times will yield a matrice which contains various fibonacci numbers, including fibonacci(n).

------------------------

    int M[2][2] = {{1,0}{0,1}}		// identity matrix

    int fib(int n)
    {
    matpow(n-1);
    return M[0][0];
    }

    void matpow(int n)
    {
    if (n > 1) {
        matpow(n/2);
        M = M*M;
    }
    if (n is odd) M = M*{{1,1}{1,0}}
    }


###########################################
Maximum sub-sequence problem: in an interger arrray containing +ve and -ve nos..

http://people.cis.ksu.edu/~rhowell/algorithms-text/maxsum/		[5 java codes]

http://docs.google.com/viewer?a=v&q=cache:NQ9w8zX1BkoJ:www.wou.edu/~broegb/Cs345/MaxSubsequenceSum.pdf+maximum+subsequence+sum&hl=en&gl=us&pid=bl&srcid=ADGEESilEQbI-MZ7fpWAAblbJzjs8vsn2fLvb0YXuDvKa73v7e7p8KXIrj16QSQWmW5FZsb5ZR07QgaAQTgHoJ_VvgQxiHy6u7lz3hGyYkgQ1umqLWptilBI6RKl36-M_rl6BW0rBwzs&sig=AHIEtbT4TeaeNPJD1py3r5-u4pWQCE_4gw

Quick sort another impl.:

/*  Quicksort:  Sort an array a, using the quicksort
 *  algorithm.
 */

void Quicksort( aType a[], int first, int last )
{
    int pivot;

    if( first < last ) {
        pivot = Pivot( a, first, last );
        Quicksort( a, first, pivot-1 );
        Quicksort( a, pivot+1, last );
    }
}


/*  Pivot:  Find and return the index of pivot element.
 */

int Pivot( aType a[], int first, int last )
{
    int  p = first;
    aType pivot = a[first];

    // { 7, 13, 1, 3, 10, 5, 2, 4 };
    for( int i = first+1 ; i <= last ; i++ ) {
        if( a[i] <= pivot ) {
            p++;
            Swap( a[i], a[p] );
        }
    }

    Swap( a[p], a[first] );

    return p;
}

#! >>>>>>>>>>>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Quick sort simple impl.:
#! >>>>>>>>>>>>>>>>>>>>>>>>>> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

void quicksort (int[] a, int lo, int hi)
{
//  lo is the lower index, hi is the upper index
//  of the region of array a that is to be sorted
    int i=lo, j=hi, h;

    // comparison element x
    int x=a[(lo+hi)/2];

    //  partition
    do
    {
        while (a[i]<x) i++;
        while (a[j]>x) j--;
        if (i<=j)
        {
            h=a[i]; a[i]=a[j]; a[j]=h;
            i++; j--;
        }
    } while (i<=j);

	// VKC: here i is the index returned by Cormen partition...

    //  recursion
    if (lo<j) quicksort(a, lo, j);
    if (i<hi) quicksort(a, i, hi);
}

# reverse link list:

Node *reverseList(Node *current, Node *parent)
{
   Node *revHead;
   if(current == null)
      revHead = parent;
   else
   {
      revHead = reverseList(current->next,current);
      current->next = parent;
   }
   return revHead;
}

Initial method call should be
	head = reverseList(head,NULL)

###########################################

###########################################
       http://www.yolinux.com/TUTORIALS/C++Singleton.html

       Singleton C++ example:

01	#include <string>
02
03	class Logger{
04	public:
05	   static Logger* Instance();
06	   bool openLogFile(std::string logFile);
07	   void writeToLogFile();
08	   bool closeLogFile();
09
10	private:
11	   Logger(){};  // Private so that it can  not be called
12	   Logger(Logger const&){};             // copy constructor is private
13	   Logger& operator=(Logger const&){};  // assignment operator is private
14	   static Logger* m_pInstance;
15	};

Logger* Logger::Instance()
12	{
13	   if (!m_pInstance)   // Only allow one instance of class to be generated.
14	      m_pInstance = new Logger;
15
16	   return m_pInstance;
17	}

# to make a thread safe version of above ....
#-----------------------------------------------

Logger* Logger::Instance()
{
if (!m_pInstance)   // Only allow one instance of class to be generated.
	lock.acquire();
	if (! m_pInstance)    // this is done to prevent double assignment of the pointer by 2nd thread
       		m_pInstance = new Logger;
	lock.release();

return m_pInstance;
}


###########################################

how to sort link list:?
	net says mergesort, but have to read

# divide
# best case O(n), worst nlogn
# Space  O(n)
void mergesort(int lo, int hi)
{
    if (lo<hi)
    {
        int m=(lo+hi)/2;
        mergesort(lo, m);
        mergesort(m+1, hi);
        merge(lo, m, hi);
    }
}

# merge
// Straightforward variant
void merge(int lo, int m, int hi)
{
    int i, j, k;

    // copy both halves of a to auxiliary array b
    for (i=lo; i<=hi; i++)
        b[i]=a[i];

    i=lo; j=m+1; k=lo;
    // copy back next-greatest element at each time
    while (i<=m && j<=hi)
        if (b[i]<=b[j])
            a[k++]=b[i++];
        else
            a[k++]=b[j++];

    // copy back remaining elements of first half (if any)
    while (i<=m)
        a[k++]=b[i++];
}

###########################################
# catalan:

public static void printPar(int l, int r, char[] str, int count) {
  if (l < 0 || r < l) return; // invalid state
  if (l == 0 && r == 0) {
    System.out.println(str); // found one, so print it
  } 
  else {
    if (l > 0) { // try a left paren, if there are some available
      str[count] = '(';
          printPar(l - 1, r, str, count + 1);
          }
    if (r > l) { // try a right paren, if there’s a matching left
          str[count] = ')';
      printPar(l, r - 1, str, count + 1);
          }
  }
}


###########################################
Combinations:	wxyz		Call like: 	docombine (in, out, len , 0 , 0);

w        x      y    z
wx      xy    yz
wxy    xyz
wxyz   xz
wxz
wy
wyz
wz

void DoCombine (char in[], char out [] , int length, int fillptr, int start)
{
  int i ;
  for (i = start; i < length; i++) {
    out[fillptr] = in[i]; /* select current letter */
    out[fillptr + 1] = '\o' ; /* tack on NUL for printf */
    printf("%s\n", out);

    if (i < length - 1) /* recurse if more letters in input */
        DoCombine(in, out, length, fillptr +1 , i + 1);
  }
}

[vchauras@sac07:~/tmp/temp-cpps/temp-prgs]$ ./a.out
a
ab
abc
abcd
abd
ac
acd
ad
b
bc
bcd
bd
c
cd
d


###########################################
sartaj sahni:

void Perm(T list[], int k, int m)
{// Generate all permutations of list[k:m].
   int i;
   if (k == m) {// list[k:m] has one permutation, output it
                for (i = 0; i <= m; i++)
                   cout << list[i];
                cout << endl;
                }
   else  // list[k:m] has more than one permutation
         // generate these recursively
         for (i = k; i <= m; i++) {
            Swap(list[k], list[i]);
            Perm(list, k+1, m);
            Swap(list[k], list[i]);
            }
}


# if duplicates are thr:
# A simple solution would be to keep track of all characters used at a stack call while permuting.

void permutate( char[] str, int index )
{
  if( index == strlen(str) )
  { // We have a permutation so print it
    printf(str);
    return;
  }

  char used[255];
  bzero(used, sizeof(used));

  int i;
  for( i = index; i < strlen(str); i++ )
  {
    if( (int)used[arr[i]] != 0)
    {
      continue;
    }

    used[arr[i]] = 1;

    swap( str[index], str[i] ); // It doesn't matter how you swap.'
    permutate( str, index + 1 );
    swap( str[index], str[i] );
  }
}

# if duplicates are there : (this is possibly wrong) ... sort string first , then possilbly correct

void permutate( char[] str, int index )
{
    int i = 0;
    static lastChar = 0;
    if( index == strlen(str) )
    { // We have a permutation so print it
        printf(str);
        return;
    }
    for( i = index; i < strlen(str); i++ )
    {
        if( lastChar == str[i] ) {
            continue;
        } else {
            lastChar = str[i];
        }
        swap( str[index], str[i] ); // It doesn't matter how you swap.'
        permutate( str, index + 1 );
        swap( str[index], str[i] );
    }
}

permutate( sort("Hello World"), 0 );


###########################################
# 2nd method:
    // print N! permutation of the elements of array a (not in order)
    public static void perm2(String s) {
       int N = s.length();
       char[] a = new char[N];
       for (int i = 0; i < N; i++)
           a[i] = s.charAt(i);
       perm2(a, N);
    }

    private static void perm2(char[] a, int n) {
        if (n == 1) {
            System.out.println(a);
            return;
        }
        for (int i = 0; i < n; i++) {
            swap(a, i, n-1);
            perm2(a, n-1);
            swap(a, i, n-1);
        }
    }

###########################################/
7. write a generalised macro to swap 2 vars. (vars can be of int, str,
double, etc)

    #define SWAP(A, B) {struct tempStruct { char C[sizeof(A)];} \
    swap_tmp;\
    swap_tmp = *( struct tempStruct*) &A;\
    *( struct tempStruct*) &A = *( struct tempStruct*) &B;\
    *( struct tempStruct*) &B = swap_tmp;}

#define swap(x,y) do \
   { unsigned char swap_temp[sizeof(x) == sizeof(y) ? (signed)sizeof(x) : -1]; \
     memcpy(swap_temp,&y,sizeof(x)); \
     memcpy(&y,&x,       sizeof(x)); \
     memcpy(&x,swap_temp,sizeof(x)); \
    } while(0)


###########################################/
into binary code:

char *
baseconv(unsigned int num, int base)
{
	static char retbuf[33];
	char *p;

	if(base < 2 || base > 16)
		return NULL;

	p = &retbuf[sizeof(retbuf)-1];
	*p = '\0';

	do {
		*--p = "0123456789abcdef"[num % base];
		num /= base;
	} while(num != 0);

	return p;
}

###########################################/
# rotate a matrix 180 deg.
# memorise: i->j ...rotate by 180 .... j->i ... do n-j-1

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            ret[i, j] = matrix[n - j - 1, i];
        }
    }

###########################################/
transpose:

for(i=0;i<n;i++)
{
	for(j=0;j<n;j++)
	{
		scanf("%d",&m[i][j]);
	}
}
printf("Transpose of the Matrix :\n\n");
for(i=0;i<n;i++)
{
	for(j=i+1;j<n;j++)
	{
		t=m[i][j];
		m[i][j]=m[j][i];
		m[j][i]=t;
	}


	Read more: http://wiki.answers.com/Q/Write_a_programme_to_transpose_of_a_matrix#ixzz1ZSfWvn1v


###########################################/
	# quiora challenge

int g_pathcount = 0;

point st, end;
int nc0 = //given

void findpath (int s, int tillnow0) {
	if (tillnow0 == nc0)
		if (s == end)
			g_pathcount++;
	else {
		visited[s.x][s.y]=1;
		for (int i =0; i<4; i++) {
			int newposi = s + offset[i];

		}
	}
}


###########################################/

# Largest area under histtogram:
# http://tech-queries.blogspot.com/2011/03/maximum-area-rectangle-in-histogram.html
#
int largestArea(int arr[], int len)
{
int area[len]; //initialize it to 0
int n, i, t;
stack<int> St;  //include stack for using this #include<stack>
bool done;

for (i=0; i<len; i++)
{
  while (!St.empty())
  {
    if(arr[i] <= arr[St.top()])
    {
      St.pop();
    }
    else
    break;
  }
  if(St.empty())
  t = -1;
  else
  t = St.top();
  //Calculating Li
  area[i] = i - t - 1;
  St.push(i);
}

//clearing stack for finding Ri
while (!St.empty())
St.pop();

for (i=len-1; i>=0; i--)
{
  while (!St.empty())
  {
    if(arr[i] <= arr[St.top()])
    {
      St.pop();
    }
    else
    break;
  }
  if(St.empty())
  t = len;
  else
  t = St.top();
  //calculating Ri, after this step area[i] = Li + Ri
  area[i] += t - i -1;
  St.push(i);
}

int max = 0;
//Calculating Area[i] and find max Area
for (i=0; i<len; i++)
{
  area[i] = arr[i] * (area[i] + 1);
  if (area[i] > max)
  max = area[i];
}

return max;
}


# Question: Print a binary tree in zig-zag level order. Zig-zag means print 1st level from left to right, then 2nd level right to left and alternate thereafter

# Pseduoe code:   (Its WRONG, use 2 stacks instead of 2 Queues)
void zigzag (node *r) {
  Queue <node *> Q1, Q2;
  int direc = 1;
  if (r) 
  Q1.add (r);

  bool done = true;

  while (done) {
    if (direc == 1) {
      while (!Q1.isEmpty)) {
      node *x = Q1.delete();
      printf x->data;
      if (x->right) Q2.add (x->right);
      if (x->left) Q2.add (x->left);
    }
  }
  else {
    while (!Q2.isEmpty)) {
    node *x = Q2.delete();
    printf x->data;
    if (x->left) Q2.add (x->left);
    if (x->right) Q2.add (x->right);
  }
  direc *= -1;
  done = ~ (Q1.isEmpty() & Q2.isEmpty() );
}
}
}

####################################
# Question: Binary tree structure is defined as:

struct tree{  
  int val;  
  tree* left;  
  tree* right;  
  tree* rpeer;      
};  

# ‘rpeer’ will have the address of next node of same level. For last node at any level, rpeer will be NULL.
# At the beginning, all the rpeer nodes are assigned NULL. Write a program to populate correct value in rpeer for whole tree.

# 
void set_peer_SimplelevelOrder (node *n) {
  if (!n) return;
  /*
  Queue <node *> Q(0);
  int nodes = count(n);
  Q.add(n);
  Q.add("\n");
  n->peer = 0;
  LinkedList <node*> ll(0);

  while (!Q.isEmpty()) {
  node *x = Q.delete();
  if (x->data == "\n") {
  Q.add ("\n");
  assign peer in array list
  }
  else {
  if (x->left) Q.add (x->left);
  if (x->right) Q.add (x->right);
  }
  } */

  ArrayList <node *> al(0);
  al.add (n);
  al.add ("\n");
  ptr = 0;
  nodes--;

  while (1) {
    if (al[ptr]->data == "\n") {
      al.add ("\n");
    }
    else {
      if (x->left) {  Q.add (x->left); --nodes; }
      if (x->right) { Q.add (x->right); --nodes; }
    }
    if (!nodes)
    break;
  }

  // Traverse the list 'al' and assign the 'peer' pointers
}


####################################
# Number of inversions in an Array:
####################################

int merge(int arr[],int beg,int mid,int end) {
  int counter = 0;
  int *aux = new int[end-beg+1];
  int size = mid-beg+1;
  int i=beg,j=mid+1,k;

  for(k=0;i<=mid&&j<=end;k++) {
    if(arr[i]<=arr[j]) {
      aux[k] = arr[i++];
      size--;
    }
    else {
      aux[k] = arr[j++];
      counter += size;    /* just count when a[i] > a[j] , so mid-i+1 will be no. of inver for a[i] */
    }
  }
  if(size>0)
  while(i<=mid)
    aux[k++] = arr[i++];
  else
    while(j<=end)
      aux[k++] = arr[j++];

  for(i=beg,k=0;i<=end;i++,k++)
  arr[i] = aux[k];

  return counter;
}

int inversn(int arr[],int beg,int end) {
  static int count = 0;
  if(beg<end) {
    int mid = (beg+end)/2;
    inversn(arr,beg,mid);
    inversn(arr,mid+1,end);
    count += merge(arr,beg,mid,end);
  }
  return count;
}

int main() {
  int arr[] = {10,2,30,4,50,6,7,8};
  cout<<inversn(arr,0,7)<<endl;

system("pause");
return 0;
}
'''"//
################################################

std::auto_ptr and std::tr:ptr are used for storing ptrs so that desctructor are called when var is out of scope item13:
  they are not gud with arrays

    e.g. std:tr1:shared_ptr<Widget> pw (new Widget());
################################################

Clone a graph (use BFS or DFS but with a global hashmap)
################################################

Sliding window question: use Dqueue and store max. at the last

void maxSlidingWindow(int A[], int n, int w, int B[])
{
  deque<int> Q;

  //Initilize deque Q for first window
  for (int i = 0; i < w; i++)
  {
    while (!Q.empty() && A[i] >= A[Q.back()])
      Q.pop_back();
    Q.push_back(i);
  }

  for (int i = w; i < n; i++)
  {
    B[i-w] = A[Q.front()];

    //update Q for new window
    while (!Q.empty() && A[i] >= A[Q.back()])
      Q.pop_back();

    //Pop older element outside window from Q    
    while (!Q.empty() && Q.front() <= i-w)
      Q.pop_front();

    //Insert current element in Q
    Q.push_back(i);
  }
  B[n-w] = A[Q.front()];
}


################################################

Water in histrogram:

Solution: This is a relatively simple DP problem. Here we only give the main idea.
- For a particular bar bi, if we know the highest bar on its left Li and highest bar on its right Ri.  If the height of bi is smaller than both Li and Ri, the water volume can be held on this bar is min(Li, Ri) - hi; otherwise, it can't hold water.
- To calculate Li and Ri, we just need to record the maximum height we had observed so far from the left (and from the right). Therefore, a O(n) algorithm is straightforward here.

################################################

Min Vertex cover of Tree:

Solution: The minimum vertex cover for a general graph is a NP-hard problem. However, for a tree, there is a linear solution. The idea here is to do DFS search plus post-order traversal. If we encounter a leaf node and the edge connecting this leaf node with its parent, we know in order to construct a vertex cover, we must include at least one of the node (the leaf node, or its parent). Here we can use a greedy approach. We can see selecting the leaf doesn't give us any extra benefit, while selecting the parent can give us some benefit, since the parent must be also connected to other nodes. By selecting the parent node, we can further "cover" some extra edges. With this strategy in mind, our algorithm is as follow:

we do a DFS search. When a DFS call on a child node returns, we check if the child and the parent are both unselected. If yes, we select the parent node.
After all the DFS finishes (we traverse the tree), those selected nodes form the minimum vertex cover. The cost is O(N).

Solution 2:


Preprocessing: First, use a slight variation on BFS or DFS to build a list L of leaves of T.  In the process of building L, initialize mark bits to FALSE for each node. 

while L is not empty
do f  remove first leaf from L
      if f is in T 
           then if mark[f] is FALSE and parent[f] is null
              then mark[f]  TRUE
              else if mark[f] is FALSE and parent[f] is not null
                                then mark[parent[f]]  TRUE                     
                                                remove f from T
                                                (this implicitly removes leaf-parent edge if it exists) 
                                                                if parent[f] is not null and parent[f] is not root[T]
                                                                           then if children[parent[f]] is null 
                                                                                                   then append parent[f] to L


##############################################
fibbonaci faster:

 A^n = {[fibo(n+1), fibo(n)], [fibo(n), fibo(n-1)]}.

