###########################################
vids:
#http://openclassroom.stanford.edu/MainFolder/CoursePage.php?course=IntroToAlgorithms
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
#
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
# convert sorted doubly link list to bst

#
###########################################
# A sorted doubly linked list is created from bst in O(n) time
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
    public static void join(Node a, Node b) {
        a.large = b;
        b.small = a;
    }


    /*
     helper function -- given two circular doubly linked
     lists, append them and return the new list.
    */
    public static Node append(Node a, Node b) {
        // if either is null, return the other
        if (a==null) return(b);
        if (b==null) return(a);

        // find the last node in each using the .previous pointer
        Node aLast = a.small;
        Node bLast = b.small;

        // join the two together to make it connected and circular
        join(aLast, b);
        join(bLast, a);

        return(a);
    }


    /*
     --Recursion--
     Given an ordered binary tree, recursively change it into
     a circular doubly linked list which is returned.
    */
    public static Node treeToList(Node root) {
        // base case: empty tree -> empty list
        if (root==null) return(null);

        // Recursively do the subtrees (leap of faith!)
        Node aList = treeToList(root.small);
        Node bList = treeToList(root.large);

        // Make the single root node into a list length-1
        // in preparation for the appending
        root.small = root;
        root.large = root;

        // At this point we have three lists, and it's'
        // just a matter of appending them together
        // in the right order (aList, root, bList)
        aList = append(aList, root);
        aList = append(aList, bList);

        return(aList);
    }

# 3rd method by vkc:

void convert (node *n, int whichchild) {
	if (n) {
		node *nl = convert (n->left, 0);
		node *nr = convert (n->right, 1);

		n->small = nl, n->big = nr;

		if (nl == 0 && nr == 0)
			return n;
		else if (whichchild == 0) {
			if (nr) return nr;
			else return n;
		}
		else if (whichchild == 1) {
			if (nl) return nl
			else return n
		}
	}
	else {
		return 0;
	}
}

'#

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
use two extra stacks to store min and max at every level
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


# construct binary tree from inorder and preorder
#
struct node* buildTree(char in[], char pre[], int inStrt, int inEnd)
{
  static int preIndex = 0;
 
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
		if (!s.isempty () )
			curr = S.pop();
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
###########################################

# cicular sorted array search:

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

void Inorder(struct node *root) {
while(root) {
	Inorder(root->left);
	ProcessNode(root);
	root = root->right;
	}
}


###########################################
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

	int i = 1;
	char *c = (char *) &i
	return *c;

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
  current_path.add( pair(x, y) );
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
  current_path.remove(path(x, y);
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
      if (!InDegree[i]) S.Add(i);

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
      if (!reach[u]) dfs(u, reach, label);
      u = NextVertex(v);
	}
}


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

    int M[2][2] = {{1,0}{1,0}}		// identity matrix

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
		# u can also put here lock.acquire()
14	      m_pInstance = new Logger;
		# u can also put here lock.release()
15
16	   return m_pInstance;
17	}

# to make a thread safe version of above ....
#-----------------------------------------------

Logger* Logger::Instance()
{
if (!m_pInstance)   // Only allow one instance of class to be generated.
	lock.acquire();
	if (! m_pInstance)
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
Combinations:	wxyz		Call like: 	docombine (in, out, len , 0 , 0);

w        x      y    z
wx      xy    yz
wxy    xyz
wxyz   xz
wxz
wy
wyz
wz

void DoCombine (char in[], char out [] , int length, int recursLev, int start)
{
  int i ;
  for (i = start; i < length; i++) {
    out[recursLev] = in[i]; /* select current letter */
    out[recursLev + 1] = '\o' ; /* tack on NUL for printf */
    printf("%s\n", out);

    if (i < length - 1) /* recurse if more letters in input */
        DoCombine(in, out, length, recursLev +1 , i + 1);
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

swap( str[index], str[i] ); // It doesn't matter how you swap.
permutate( str, index + 1 );
swap( str[index], str[i] );
}
}



# if duplicates are there : (this is possibly wrong)

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
} permutate( sort("Hello World"), 0 );


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
