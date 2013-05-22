###########################################
# Sum carry 3 bits
a , b, c

sum = (a+b+c)%2;  = a^b^c
car = (a+b+c)/2;  = (a&b) | (b&c) | (c&a)

Value
kilobyte (kB) 10^3 2^10 
megabyte (MB) 10^6 2^20
gigabyte (GB) 10^9 2^30
terabyte (TB) 10^12  2^40

###########################################
# edit distance "algorithm" to "altruistic"

    int compute_edit_distance(string x, string y)
    {
      int x_len = x.length();
      int y_len = y.length();
     
      vector<vector<int> > m(x_len+1, vector<int>(y_len+1, 0));
     
      int i, j;
      for (i = 1; i <= x_len; i++) {
        m[i][0] = i;
      }
     
      for (j = 1; j <= y_len; j++){
        m[0][j] = j;
      }
         
      for (i = 1; i <= x_len; i++){
        for (j = 1; j <= y_len; j++){
          int c1 = m[i-1][j] + 1;      
          int c2 = m[i][j-1] + 1;
          int c3 = (x[i-1] == y[j-1]) ? m[i-1][j-1] : m[i-1][j-1] + 1;
          m[i][j] = min(c1, min(c2, c3));
        }
      }
     
      return m[x_len][y_len];
    }
 

###########################################
# http://stackoverflow.com/questions/245878/how-do-i-choose-between-a-hash-table-and-a-trie-prefix-tree


# in c++ , u can pass 2d like:
  how-to-pass-2d.cpp

# how to init 2d vector of ints       // make sure +1 since base=0
  int n=3, a=4, s=10;
  vector< vector<int> > visited (n+1, vector<int> (s+1,0));

# map can have following key-value types

  // test if map can have types below
  map <int, vector<int>::iterator> myset;
  vector<int> v;
  v.push_back(1);
  v.push_back(2);
  v.push_back(3);
  myset[1] = v.begin()+0;
  myset[2] = v.begin()+1;
  myset[3] = v.begin()+2;

###########################################
# Own shared_ptr impl.

template < typename T > 
class SP
{
  private:
    T*    pData;       // pointer
    RC* reference; // Reference count

  public:
    SP() : pData(0), reference(0) 
  {
    // Create a new reference 
    reference = new RC();
    // Increment the reference count
    reference->AddRef();
  }

    SP(T* pValue) : pData(pValue), reference(0)
  {
    // Create a new reference 
    reference = new RC();
    // Increment the reference count
    reference->AddRef();
  }

    SP(const SP<T>& sp) : pData(sp.pData), reference(sp.reference)
  {
    // Copy constructor
    // Copy the data and reference pointer
    // and increment the reference count
    reference->AddRef();
  }

    ~SP()
    {
      // Destructor
      // Decrement the reference count
      // if reference become zero delete the data
      if(reference->Release() == 0)
      {
        delete pData;
        delete reference;
      }
    }

    T& operator* ()
    {
      return *pData;
    }

    T* operator-> ()
    {
      return pData;
    }

    SP<T>& operator = (const SP<T>& sp)
    {
      // Assignment operator
      if (this != &sp) // Avoid self assignment
      {
        // Decrement the old reference count
        // if reference become zero delete the old data
        if(reference->Release() == 0)
        {
          delete pData;
          delete reference;
        }

        // Copy the data and reference pointer
        // and increment the reference count
        pData = sp.pData;
        reference = sp.reference;
        reference->AddRef();
      }
      return *this;
    }
};


class RC
{
  private:
    int count; // Reference count

  public:
    void AddRef()
    {
      // Increment the reference count
      count++;
    }

    int Release()
    {
      // Decrement the reference count and
      // return the reference count.
      return --count;
    }
};
  #   Always create smart pointers on a separate line of code, never in a parameter list, so that a subtle resource leak won't occur due to certain parameter list allocation rules.
    http://msdn.microsoft.com/en-us/library/vstudio/hh279674.aspx




###########################################
# memcpy    : no overlap check
#include <stddef.h> /* size_t */
void *memcpy(void *dest, const void *src, size_t n)
{
  char *dp = dest;
  const char *sp = src;
  while (n--)
    *dp++ = *sp++;
  return dest;
}

# memmove : check overlap, slower than memcpy
void *memmove(void *dest, const void *src, size_t n)
{
    unsigned char *pd = dest;
    const unsigned char *ps = src;
    if (__np_anyptrlt(ps, pd))
        for (pd += n, ps += n; n--;)    // do backward copying
            *--pd = *--ps;
    else
        while(n--)
            *pd++ = *ps++;
    return dest;
}

# __np_anyptrlt  => zero if p1 and p2 point within the same object and p1 is greater than p2

With memcpy, the destination cannot overlap the source at all. With memmove it can. This means that memmove might be very slightly slower than memcpy, as it cannot make the same assumptions.

For example, memcpy might always copy addresses from low to high. If the destination overlaps after the source, this means some addresses will be overwritten before copied. memmove would detect this and copy in the other direction - from high to low - in this case. However, checking this and switching to another (possibly less efficient) algorithm takes time.


###########################################
# Inorder successor/predecessors. I parent pointer is given then okay, else its tricky
# http://www.geeksforgeeks.org/inorder-successor-in-binary-search-tree/

# struct node * inOrderSuccessor(struct node *root, struct node *n)
{
    // step 1 of the above algorithm
    if( n->right != NULL )
        return minValue(n->right);
 
    struct node *succ = NULL;
 
    // Start from root and search for successor down the tree
    while (root != NULL)
    {
        if (n->data < root->data)
        {
            succ = root;
            root = root->left;
        }
        else if (n->data > root->data)
            root = root->right;
        else
           break;
    }
 
    return succ;
}

###########################################
vids:
#http://openclassroom.stanford.edu/MainFolder/CoursePage.php?course=IntroToAlgorithms
http://www.cs.pitt.edu/~kirk/algorithmcourses/index.html
http://basicalgos.blogspot.com/2012/03/10-regular-expression-matching.html
http://stackoverflow.com/questions/500607/what-are-the-lesser-known-but-useful-data-structures

# list of trading firms:  http:/tradertestorg/list.php
codechef.com
codeeval.com
codeforces.com
spoj.com
udacity.com
projecteuler.net
http://letschat.info/list-of-all-google-interview-questions/
http://letschat.info/list-of-facebook-questions/

# epic : http://www.careercup.com/question?id=14946605        GOOD  (3 ways)
#   1. make a graph, find longest path
#   2. brute force : start from every i,j
#   3. dynamic programming

      for each cell we need to keep maximum length of a snake which ends in this cell. Corresponding recurrence for calculating value in cell[i][j]:

         dp[i][j] = 1; // snake can always be of length 1
         if (abs(grid[i][j - 1] - grid[i][j]) == 1){
            dp[i][j] = max(dp[i][j], dp[i][j - 1] + 1);
         }
         if (abs(grid[i - 1][j] - grid[i][j]) == 1){
            dp[i][j] = max(dp[i][j], dp[i - 1][j] + 1);
         }

      The answer would be the maximum of dp[i][j] for all i, j on the grid.
      Space/Time complexity O(n*m).


# OO design questions:
  https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions

# http://www.quora.com/Dynamic-Programming/How-do-you-solve-the-pots-of-gold-game

# LRU implementation like Galvin:  
  # http://www.geeksforgeeks.org/implement-lru-cache/
  DLL as Queue, most recently used is at head, LRU at tail
  Hashmap <key = page number , value is Queue node* >

  # impl. of Trie:  http://www.cs.bu.edu/teaching/c/tree/trie/  
  Implements like:
  typedef struct trieNodeTag {
    char key;
    trieValueT value;
    struct trieNodeTag *next, *children;    // chars at single level under a single node are in link list, *children is the first children
  } trieNodeT;
  # Looking up data in a trie is faster in the worst case, O(m) time, compared to an imperfect hash table. An imperfect hash table can have key collisions. A key collision is the hash function mapping of different keys to the same position in a hash table. The worst-case lookup speed in an imperfect hash table is O(N) time, but far more typically is O(1), with O(m) time spent evaluating the hash.



# fb_ques
    # http://www.glassdoor.com/Interview/You-are-trying-to-rob-houses-on-a-street-Each-house-has-some-ve-amount-of-cash-Your-goal-is-to-rob-houses-such-that-you-QTN_117978.htm
You are trying to rob houses on a street. Each house has some +ve amount of cash. Your goal is to rob houses such that you maximize the total robbed amount. The constraint is once you rob a house you cannot rob a house adjascent to that house.

              public class Solution {
                  public int findMax(int[] houses) {
                      if (houses == null || houses.length == 0) {
                          return 0;
                      } else if (houses.length == 1) {
                          return houses[0];
                      } else if (houses.length == 2) {
                          return Math.max(houses[0], houses[1]);
                      }

                      int[] res = new int[houses.length];
                      res[0] = houses[0];
                      res[1] = Math.max(houses[0], houses[1]);

                      int max = res[1];

                      for (int i = 2; i < houses.length; i++) {
                          res[i] = Math.max(res[i - 2] + houses[i], res[i - 1]);

                          if (res[i] > max) {
                              max = res[i];
                          }
                      }

                      return max;
                  }
              }

# sort C++ string 
  string word = "dbac";
  std::sort(word.begin(), word.end());
  see "amz_sort_char_array.cpp" where u can impl. class which overloads operator() (int i, int j)
  For C++ string, u can use macroo like tr(), all()

# MEDIAN of stream of nos. :
  # http://codercareer.blogspot.com/2012/01/no-30-median-in-stream.html
      Soln:   Use min-heap and max-heap and keep on putting new elements 
              in of the heaps on a decision, and their tops will be the median

             void Insert(T num)
            {
                if(((minHeap.size() + maxHeap.size()) & 1) == 0)
                {
                    if(maxHeap.size() > 0 && num < maxHeap[0])
                    {
                        maxHeap.push_back(num);
                        push_heap(maxHeap.begin(), maxHeap.end(), less<T>());

                        num = maxHeap[0];

                        pop_heap(maxHeap.begin(), maxHeap.end(), less<T>());
                        maxHeap.pop_back();
                    }

                    minHeap.push_back(num);
                    push_heap(minHeap.begin(), minHeap.end(), greater<T>());
                }
                else
                {
                    if(minHeap.size() > 0 && minHeap[0] < num)
                    {
                        minHeap.push_back(num);
                        push_heap(minHeap.begin(), minHeap.end(), greater<T>());

                        num = minHeap[0];

                        pop_heap(minHeap.begin(), minHeap.end(), greater<T>());
                        minHeap.pop_back();
                    }

                    maxHeap.push_back(num);
                    push_heap(maxHeap.begin(), maxHeap.end(), less<T>());
                }
            }

            int GetMedian()
            {
                int size = minHeap.size() + maxHeap.size();
                if(size == 0)
                    throw exception("No numbers are available");

                T median = 0;
                if(size & 1 == 1)
                    median = minHeap[0];
                else
                    median = (minHeap[0] + maxHeap[0]) / 2;

                return median;
            }

# Babylonian method for sqrt:
    X(n+1) = 1/2 * ( X(n) + S/X(n) )
    S => whose sqrt has to be found
    You choose seed as X(n) and then iterate. Keep on looping till X(n+1) ~ X(n)

# TSP dynamic programing : O(n^2 2^n) algorithm for TSP

# http://www.quora.com/Algorithms/Given-an-integer-array-such-that-every-element-occurs-3-times-except-one-element-which-occurs-only-once-how-to-find-that-single-element-in-O-1-space-and-O-n-time-complexity

# Median of medians:
    T(n) = T(n/5) + O(n) +          T(7n/10)
          = (finding good pivot) + iterate of the max. size bag

###########################################
#Tic-tac-toe N*N board:

    Use NxN int matrix and 2N + 2 integers representing the sum of N cols, N rows and 2 diagonals.
    Player 1's choices will be marked as 1.
    Player 2's choices will be marked as -1.
    Add that mark (+-1) to the relevant row/col/diag counters.
    Player 1 wins if after adding the mark the row/col/diag is sum is N.
    Player 1 wins if after adding the mark the row/col/diag is sum is -N.
    They draw if matrix is full.

    Calculating game result is immediate.

    - avico81 on November 06, 2012 | Flag

###########################################
# Next higher palindrome number:

          case 1: midle left> midle right.

          take the case of say. 934267 take middle two numbers 4 and 2 . if left greater than right change 2 to 4.and replace other numbers from left to right ,, therefre..

          934267

          934467

          934439

          case 2: middle left < middle right

          take 932467

          take middle two.. if left <right.. left++ …. rigt = left

          932467

          933367

          933339

          case 3:middle numbers are equal.

          take 932267

          if middle numbers equal..

          increment middle numbers.

          by 1.and make palindrome.

          933339

          neone finds a case that does not match ?? please let me know.

          2353 ->2442

          4245->4334

          395887->396693



###########################################
# Min max of array
#
          Time Complexity: O(n)
          Total number of comparisons: let number of comparisons be T(n). T(n) can be written as follows:
          Algorithmic Paradigm: Divide and Conquer

                       
            T(n) = T(floor(n/2)) + T(ceil(n/2)) + 2  
            T(2) = 1
            T(1) = 0
          If n is a power of 2, then we can write T(n) as:

             T(n) = 2T(n/2) + 2 
          After solving above recursion, we get

            T(n)  = 3/2n -2 

# 
###########################################
# Range type Trees:

# Interval Tree : (Cormen) Intervals given in form (low, high). Make AVL BST using low as keys. Each node also tells max. 'high' its subtree has). Pg. 369 - cormen
  You can search in log(n) time, any given interval 'i' if it even slightly overlaps with any interval in BST
  Insert/Delete takes log(n) time.
  -> Time to build : nlogn (building AVL tree)
  -> Space         : n
  -> Query time    : O(log n)
  -> Can do        : Can search for an overlapping 'i'

# Segment Tree: In computer science, a segment tree is a tree data structure for storing intervals, or segments. It allows querying 'which of the stored segments contain a given point'. It is, in principle, a static structure; that is, its content cannot be modified once the structure is built. A similar data structure is the interval tree. 
A segment tree for a set I of n intervals uses O(n log n) storage and can be built in O(n log n) time. Segment trees support searching for all the intervals that contain a query point in O(log n + k), k being the number of retrieved intervals or segments.[1]
  -> Time to build : nlogn
  -> Space         : nlogn
  -> Query time    : O(log n + k)
  -> Can do        : search all intervals which contain a point

# Range Tree : link = ucsb-RangeSearching.pdf (@prep)
A set of n points in the plane can be preprocessed in O(nlogn) time into a data structure of O(nlogn) 'SPACE'  so that any 2D range query can be answered in O(logn^2 +k) time, where k is the number of answers reported
  -> Time to built :  can be build in n2logn time (naive) or pre-sort y list O(nlogn)
  -> Query time    :  O(logn^2+k)
  -> Space         :  O(nlogn)
  -> Can do        :  #of point lying b/w (x1,y1) (x2,y2)
  

###########################################
# bellman-ford : (single source shortest path)
# Bellman.Ford runs in O(|V|·|E|) time, where |V| and |E| are the number of vertices and edges respectively.
  Main loop runs for V-1 times. 
  In LAST:     if (for every edge u-v)  
                  u.distance + uv.weight < v.distance:
                 error "Graph contains a negative-weight cycle"

    for (int i = 1; i <= V-1; i++)
        {
            for (int j = 0; j < E; j++)
            {
                int u = graph->edge[j].src;
                int v = graph->edge[j].dest;
                int weight = graph->edge[j].weight;
                if (dist[u] + weight < dist[v])
                    dist[v] = dist[u] + weight;
            }
        }
                 
    # http://www.geeksforgeeks.org/dynamic-programming-set-23-bellman-ford-algorithm/

# -ve weight cycle means that it has a cycle with summing -ve cost. Hence it keeps on rotating

# Dijkstra (directed/undirected)
      Time Complexity of the implementation is O(V^2). If the input graph is represented using adjacency list, it can be reduced to O(E log V) with the help of binary heap. We will soon be discussing O(E Log V) algorithm as a separate post.
      # Matrix impl @ http://www.geeksforgeeks.org/greedy-algorithms-set-6-dijkstras-shortest-path-algorithm/


# Floyd-Warshall algorithm O(V^3) | weighted, directed graph | NO negative cycle
      let dist be a |V| × |V| array of minimum distances initialized to 8 (infinity)
      let next be a |V| × |V| array of vertex indices initialized to null

      procedure FloydWarshallWithPathReconstruction ()
         for each vertex v
            dist[v][v] = 0
         for each edge (u,v)
            dist[u][v] = w(u,v)  // the weight of the edge (u,v)
         for k from 1 to |V|
            for i from 1 to |V|
               for j from 1 to |V|
                  if dist[i][k] + dist[k][j] < dist[i][j] then
                     dist[i][j] = dist[i][k] + dist[k][j]
                     next[i][j] = k

      function Path (i, j)
         if dist[i][j] = INFINITY then
           return "no path"
         var intermediate = next[i][j]
         if intermediate = null then
           return " "   // the direct edge from i to j gives the shortest path
         else
           return Path(i, intermediate) + intermediate + Path(intermediate, j)


          >> Hence, to detect negative cycles using the Floyd–Warshall algorithm, one can inspect the diagonal of the path matrix, and the presence of a negative number indicates that the graph contains at least one negative cycle.[2] Obviously, in an undirected graph a negative edge creates a negative cycle (i.e., a closed walk) involving its incident vertices.
          >> The idea is to one by one pick all vertices and update all shortest paths which include the picked vertex as an intermediate vertex in the shortest path. When we pick vertex number k as an intermediate vertex, we already have considered vertices {0, 1, 2, .. k-1} as intermediate vertices. 
          >> Find cycle of shortest length in a directed graph with positive weights @ http://stackoverflow.com/questions/3911626/find-cycle-of-shortest-length-in-a-directed-graph-with-positive-weights/3912537#3912537
            => collorary: You can use Dijkstra to find the shortest-Cycle passing through vertex v    http://goo.gl/BsYU0


# DFS application (path finding, cycle finding (nodes forming cycle))
        # http://ww3.algorithmdesign.net/handouts/DFS.pdf

###########################################
# Select Algo: kth largest unsorted array

        The algorithm in words:
        1.    Divide n elements into groups of 5
        2.    Find median of each group (How?  How long?)
        3.    Use Select() recursively to find median x of the .n/5.  medians
        4.    Partition the n elements around x.  Let k = rank(x)
        5.    if (i == k) then return x
            if (i < k) then use Select() recursively to find ith smallest     element in first partition
            else (i > k) use Select() recursively to find (i-k)th smallest    element in last partition

###########################################
# clone a graph: using DFS or BFS
            Node* DFS(Node *Input, hash_map &hm){

              if(hm.find(Input) != hm.end()){
                return hm[Input];
              }
              Node *output = new Node();
              hm[Input] = output;
              for(int i = 0; i next.size();i++){
                output->next.push_back(DFS(Input->next[i],hm));
              }
              return output;
            }

###########################################
# DP:

#  Given an array of strings of 0s and 1s. X and Y are also given. Return the maximum number of elements in a subset of the array elements which will X number of zeroes and Y number of 1s when combined. For eg: if array[] = {"01", "10", "0", "110"} X=3, Y=2 | Answer should be 3 since first 3 strings when combined will give the required number of 0s and 1s.
              B(k, (X,Y)) = max (_1, _2);
                            _1 => B(k-1, (X,Y))
                            _2 => B(k-1, (X-x[k],Y-y[k]))


# Optimal BST "keys[0.. n-1] of search keys and an array freq[0.. n-1] of frequency counts"
     >> it fills like Matrix multiplication

# 0-1 Knapsack problem algo:
    B[i, K] -> max. benefit  using i items and K size knapsack
    B[i, K] = max { B[i-1, K] if w[i] > K
                  { max (B[i-1, K] , B[i-1, K-w[i]]+v[i])


# Knapsack problem (multiple items allowed) algo:   @ http://tech-queries.blogspot.com/2011/04/integer-knapsack-problem-duplicate.html
# http://en.wikipedia.org/wiki/Knapsack_problem#Unbounded_knapsack_problem    | good explanation | can reduce complexity by dividing the w's by GCD of W and w[]

    M(j) -> maximum posssible value one can pack in size=j knapsack
    M(j) = max { 
                M(j-1) ,      if jth slot is empty in optimal soln.
                forall (items i) 
                  max { M(j-w[i]) + v[i] }     if some item [i] occupies jth slot
              }
              # Integer knapsack , multiple items permitted:

              int knapsack(int value[], int weight[], int n, int C, vector<int> backtrack)
              {
               int *M = new int[C+1];
               int i, j, tmp, pos;
               for(i=1; i<= C; i++)
               {
                   M[i] = M[i-1];
                   pos = i-1;             
                   for(j=0; j< n; j++)
                   {
                       if (i >= weight[j])
                           tmp = M[i-weight[j]] + value[j];
                       if (tmp > M[i]){
                           M[i] = tmp;
                           pos = i - weight[j];
                       }
                   }
                   backtrack.push_back(pos);
               } 
               int ans = M[C];
               delete[] M;      
               return ans;
              }

                

#LIS :
# DP approach:
#             LIS ending at index(i) = max (LIS ending at index(j)) + 1 [ if a[i] > a[j] ]
#
# nlogn approach: http://www.geeksforgeeks.org/longest-monotonically-increasing-subsequence-size-n-log-n/

              1. Design an algorithm to construct the longest increasing list. Also, model your solution using DAGs.
              2. Design an algorithm to construct all monotonically increasing lists of equal longest size.
              3. Is the above algorithm an online algorithm?
              4. Design an algorithm to construct the longest decreasing list..

# Box stacking based on LIS (start with sorting input in order of decreasing base area)
      H(j) = tallest stack of boxes with box[j] at top


#Longest Bitonic seq. : Find 
                          LIS(i) -> longest incr seq ending at index i
                          LDS(i) -> longest decr seq starting at index i

                            foreach (i) {
                              Max of (LIS[i] + LDS[i] - 1);
                            }

# partition problem: divide arrray into a subset so that their P1 and P2 has sum = total/2
        #Recursive:
        Let isSubsetSum(arr, n, sum/2) be the function that returns true if 
        there is a subset of arr[0..n-1] with sum equal to sum/2

        The isSubsetSum problem can be divided into two subproblems
         a) isSubsetSum() without considering last element (reducing n to n-1)
         b) isSubsetSum considering the last element (reducing sum/2 by arr[n-1] and n to n-1)

        If any of the above the above subproblems return true, then return true. 
        isSubsetSum (arr, n, sum/2) = isSubsetSum (arr, n-1, sum/2) || isSubsetSum (arr, n-1, sum/2 - arr[n-1])

        # Dynamic Programming Solution 2D table
        # http://www.youtube.com/watch?v=GdnpQY2j064&list=PL962BEE1A26238CA3&index=10
        # see the comment here , wrong way it seems => http://www.youtube.com/watch?v=ItF22I8f3Xs
          The problem can be solved using dynamic programming when the sum of the elements is not too big. We can create a 2D array part[][] of size (sum/2)*(n+1). And we can construct the solution in bottom up manner such that every filled entry has following property

          part[i][j] = true if a subset of {arr[0], arr[1], ..arr[j-1]} has sum 
                       equal to i, otherwise false

        # 1 D table:
          int isSubsetSum(int set[], int n, int sum)
          {
              int isSum[sum+1];
              int i, j;
              isSum[0] = 1;
              for(i=0;i<n;i++)
              {
                isSum[set[i]] = 1 (possible, TRUE);
              }
              for (i = 0; i < n; i++) {
                  for (j = sum - set[i]; j >= 0; j--) {
                      if (isSum[j] == 1)
                          isSum[j+set[i]] = 1;
                  }
                  if (isSum[sum] == 1)
                      return 1;
              }
                
              return 0;
          }

        # 2nd way:
          int BalancedPartition ( int a[] , int n ){
              int sum = 0;
              for( int i = 0 ; i < n ; i++)
                  sum += a[i];

              int *s = new int[sum+1];

              s[0] = 1;
              for(int i = 1 ; i < sum+1 ; i++)    
                s[i] = 0;

              int diff = INT_MAX , ans;

              for(int i = 0 ; i < n ; i++)
              {
                  for(int j = sum ; j >= a[i] ; j--)
                  {
                      s[j] = s[j] | s[j-a[i]];
                      if( s[j] == 1 )
                      {
                          if( diff > abs( sum/2 - j) )
                          {
                              diff = abs( sum/2 - j );
                              ans = j;
                          }

                      }
                  }
              }
              cout<< ans << " " << sum-ans<< endl; //two balanced partitions
              return min( ans , sum-ans );
          }


 

# min no. of bars to partition string into palindromes
#
        // i is the starting index and j is the ending index. i must be passed as 0 and j as n-1
        minPalPartion(str, i, j) = 0 if i == j. // When string is of length 1.
        minPalPartion(str, i, j) = 0 if str[i..j] is palindrome.

        // If none of the above conditions is true, then minPalPartion(str, i, j) can be 
        // calculated recursively using the following formula.
        minPalPartion(str, i, j) = Min { minPalPartion(str, i, k) + 1 + minPalPartion(str, k+1, j) }  where k varies from i to j-1

         /* Create two arrays to build the solution in bottom up manner
             C[i][j] = Minimum number of cuts needed for palindrome partitioning
                       of substring str[i..j]
             P[i][j] = true if substring str[i..j] is palindrome, else false
             Note that C[i][j] is 0 if P[i][j] is true 
          int C[n][n];
          bool P[n][n]; */




# DP - k floors , n eggs

  k ==> Number of floors
  n ==> Number of Eggs
  eggDrop(n, k) ==> Minimum number of trails needed to find the critical
                    floor in worst case.
  eggDrop(n, k) = 1 + min{max(eggDrop(n - 1, x - 1), eggDrop(n, k - x)): 
                 x in {1, 2, ..., k}}

# 
###########################################
# Amazon q. TRICKY:
#
        Array on integer is given
        find out next bigger number 
        Ex {2,5,3,4,6,1}
        Out: 2->5
        5->6
        3->4
        4->6
        6->-1 //not possible
        1-> -1 //not possible

###########################################
# longest path in DAG:   or Atalleh

    Compute topological order of vertices: A B C D E F G H I.

    Initialize fin[v] = 0 for all vertices v.

  Mtd1:
    Consider vertices v in topological order:
      for each edge v-w, set fin[w] = max(fin[w], fin[v] + time[w])
      # https://docs.google.com/viewer?a=v&q=cache:-rOBI5bAIMwJ:www.cs.princeton.edu/courses/archive/spr04/cos226/demo/demo-pert.ppt+&hl=en&gl=us&pid=bl&srcid=ADGEESjN3gpAsSK0W0prLG1FsRmWsLvU9y6V4qsjcgAc9Lpj8ATYIegZJe4UvErIvMOC4Rf5qaaa6XZE97TLWrOp7ossjwGADKSyidpKSQvFsbGvCNzDavAIVkp5TMYa6d_8HQJ1BLEl&sig=AHIEtbSfaaUpPsMNt69HXymF60frphH7QQ

  Mtd2:
    http://goo.gl/Y7wn3

###########################################
# impl. Queue using Stacks:

http://stackoverflow.com/questions/69192/how-to-implement-a-queue-using-two-stacks
  S1, S2: 
    Q.push -> push in S1
    Q.pop -> if S2 is empty, push all elements from S1 to S2 and pop top
              else S2.pop(top)

###########################################

# C++ scope-gaurd

      void User::AddFriend(User& newFriend)
      {
          friends_.push_back(&newFriend);
          ScopeGuard guard = MakeObjGuard(friends_, &UserCont::pop_back);
          pDB_->AddFriend(GetName(), newFriend.GetName());
          guard.Dismiss();
      }

###########################################
#tr1::shared_ptr (problem of reference cycle), tr1::weak_ptr (2 smart pointers in tr1)

#std::auto_ptr and std::tr:ptr are used for storing ptrs so that desctructor are called when var is out of scope item13:
      * The major problems introduced by auto_ptr are:

          * Copying and assigning changes the owner of a resource, modifying not only the destination but also the source, which it not intuitive.
          * It cannot be used in STL containers because the constraint that a container's elements must be copy constructable and assignable does not apply to this class.'

#they are not gud with arrays

    e.g. std:tr1:shared_ptr<Widget> pw (new Widget());

    e.g auto_ptr:
    void f() {
      Investment *pInv = createInvestment();    // factory
      ...
      ...   // some exception or return might happen here
      ....
      delete p*Inv;
    }

    so, use auto_ptr like:
    void f() {
      std::auto_ptr<Investment> pInv(createInvestment());     // RAII
      OR
      std::tr1::shared_ptr <Investment> pInv(createInvestment());     // RAII
      ...
      ...
      return;
    }

    # using auto_ptr , their copy ctor and assignment operator make either one of them null. So, one pointer points always to resource
    # using shared_ptr, when u copy, then 2 pointers point to same resouce. ..... Containters can have <shared_ptr> NOT <auto_ptr>

###########################################
# binary stream divisble by 3:

  Mtd1:
    we have to just count the number of 1's (set bits) at even position and number of 1's (set bits) at odd position .    (based on bernoulis theorem) put 2 = (3-1)

  Mtd2:
    if((number of 1's at even position - number of 1's at odd position)%3==0)
    then number is divisible by 3.

    3x moves to 3x+1 if 1 comes and stays in 3x if 0 comes in the stream
    3x+1 moves to 3x if 1 comes and moves to 3x+2 if 0 comes in the stream
    3x+2 moves to 3x+1 if 0 comes and stays in 3x+2 if 1 comes

###########################################
# use binary search to find where to insert. Return 'begin'
The gist is the invariant of the binary search. 

    int searchInsert(int A[], int n, int target) {
      int begin, end, mid;

      begin = 0; end = n-1;
      while (begin <= end){
        mid= begin + (end - begin >> 1);

        if (A[mid] == target) return mid;

        if (A[mid] < target)  begin= mid+ 1;
        else end = mid -1;        
      }

      return begin ;        
    }

    # another variant of this is AMZ ques. = amz_bin_search.cpp
    For instance,  2223333444555,   num_occurrence(4) for this array is  3.

    int num_occurrence(int * A, int len, int num)
    {
        int mid;

        if (len == 0) return 0; 
        if (A[0] == num && A[len-1] == num) return len;

        mid = len / 2;
        
        if (A[mid] > num) 
          return num_occurrence(A, mid, num);
        else if (A[mid] < num)
          return num_occurrence(A + mid + 1, len - mid - 1, num);
        else{
          int left = num_occurrence(A, mid, num);
          int right = num_occurrence(A + mid + 1, len - mid -1, num);
          return left+ right + 1;
        }    
    }


###########################################
# semaphores , spinlock gud read: http://www.cis.temple.edu/~giorgio/cis307/readings/spinsem.html

The most important of these atomic operations is CompareAndSwap, denoted CAS:
          boolean CAS(int *a, int old, int new) {
          int temp = *a;
                if (temp == old) {
                   *a = new;
                   return true;
                } else 
                   return false;
             }
which is used in lock-free and wait-free algorithms. Here is an example: consider the operation x++. In most systems this is the result of three operations
            int temp = x;
            temp++;
            x = temp;

          Thus it is non safe under concurrency. Here is a lock-free implementation of the increment
            int temp = x;
            while (!CAS(&x, temp, temp+1)) {
              temp = x;
            }

###########################################
# c++ inheritance

  Type of Inheritancee
  When deriving a class from a base class, the base class may be inherited through public, protected or private inheritance. The type of inheritance is specified by the access-specifier as explained above.

  We hardly use protected or private inheritance but public inheritance is commonly used. While using different type of inheritance, following rules are applied:

  Public Inheritance: When deriving a class from a public base class, public members of the base class become public members of the derived class and protected members of the base class become protected members of the derived class. A base class's private members are never accessible directly from a derived class, but can be accessed through calls to the public and protected members of the base class.

  Protected Inheritance: When deriving from a protected base class, public and protected members of the base class become protected members of the derived class.

  Private Inheritance: When deriving from a private base class, public and protected members of the base class become private members of the derived class.

"'
###########################################
# this is how u print a vector

  vector<int> lis = find_lis(A);
 
  ostream_iterator<int> oit(cout, " ");
  copy(lis.begin(), lis.end(), oit);

# how to init 2d <vector>
  vector<vector<int> > m(len1+1, vector<int>(len2+1, 0));

###########################################
# longest common subsequence
  http://basicalgos.blogspot.com/2012/03/36-longest-common-sequence.html    important is how to construct the characters back ?

###########################################
# metd 1:
  level order printing can be done using 2 counters which count the nodes in curr_level and next_level

# mtd 2:
  void printlevel (node *n) {
  if (!n)
    return;
  Q.add(n);
  Q.add(new node *("\n"));

  while (1) {
    node *t = Q.delete();

    if (t->data != "\n" ) {
      if (lc) Q.add(lc);
      if (rc) Q.add(rc);
    }
    else {
      //BUG: when queue has a node in it, then only insert "\n" else, this is the last level
      if (Q.length())
        Q.add(new node *("\n"));
      }

    cout << t->data << " ";
  }
}
""'''
###########################################
# how to read nos. in a faster way rather than one by one

# 1 by 1 

      int i=0;
      file.read(reinterpret_cast < char* >(&i), sizeof(unsigned int));

# bunch read
      void read_file()
      {
         int buffer[4096];
         int i=0;
         long sum=0;
       
         ifstream file("binary.dat", ios::in|ios::binary);
         if(file.is_open())
         {
            while(!file.eof()) {
               int num_bytes = file.read(reinterpret_cast < char* >(buffer), sizeof(buffer));
       
               for (i = 0; i < num_bytes / sizeof(unsigned int); i++){
                   sum += buffer[i];
               }
            } 
         }
         file.close();
      }

###########################################
# fb interview: find all words in dict which can appear in a 2D matrix. Boogle game
  http://basicalgos.blogspot.com/2012/04/42-find-all-possible-words-from-2d.html


# serialze any N tree or binary-tree

      string serialize_tree(Node * root)
      {
        queue<Node*> q;
        stringstream ss;
        Node * nd;
       
        q.push(root);
         
        while (! q.empty() ){
          nd = q.front();
          q.pop();
           
          ss << nd->data << "  " << nd->children.size() <<" ";
       
          for (int i = 0; i < nd->children.size(); i++){
            q.push(nd->children[i]);
          }
        }
       
        return ss.str();
      }
       
       
      Node * deserialize_tree(string str)
      {
        if (str.length() == 0) return NULL;
       
        queue<Node*> q;
        int data = 0, num_children;  
        stringstream ss(str, ios_base::in);
       
        Node * root = NULL;
        ss >> data >> num_children;
        root = new Node(data, num_children);
         
        q.push(root);
       
        while (!q.empty()){
          Node * parent = q.front();
          q.pop();
           
          for (int i = 0; i < parent->children.size(); i++){
            ss >>  data >>  num_children;      
            parent->children[i]= new Node(data, num_children);
            if (num_children > 0)         // if thats a leaf
              q.push(parent->children[i]);
          }
        }
       
        return root;
      }

'""''' ->> <<- > <

###########################################
# code to print partitions of N=8  amz_N_as_sumElements.cpp

8->{[8], [6, 2], [5, 3], [4, 4], [4, 2, 2], [3, 3, 2], [2, 2, 2, 2]}

# code to get subarray whose sum is = K . Given = {15, 2, 4, 8, 9, 5, 10, 23}
  either O(n) or O(n^2)   : subarray_sum_K.cpp

# amz. Q. 
      How to find maximum path sum in a binary tree.
      The path need not be a top-bottom, can start and end nodes need not be root or leaf, path can start in left/right subtree and end in right/left subtree wrt any node

      # Sol: There can be 2 types of sum. (1) passing thru LCA (2) on a linear path

      private static TreeSum findMaxSum(TreeNode root)
          {
              if (root == null)
              {
                  return new TreeSum(0, 0);
              }
              TreeSum leftTreeSum = findMaxSum(root.getLeft());
              TreeSum rightTreeSum = findMaxSum(root.getRight());
              int maxSumBetweenTwoNodesOfChildren = Math.max(leftTreeSum.maxSumBetweenTwoNodes, rightTreeSum.maxSumBetweenTwoNodes);
              maxSumBetweenTwoNodesOfChildren = Math.max(maxSumBetweenTwoNodesOfChildren, leftTreeSum.maxSumFromRootToLeaf
                                                                                        + rightTreeSum.maxSumFromRootToLeaf + root.getData());
              int maxSumFromRootToLeaf = leftTreeSum.maxSumFromRootToLeaf > rightTreeSum.maxSumFromRootToLeaf
                                                                                        ? leftTreeSum.maxSumFromRootToLeaf + root.getData()
                                                                                        : rightTreeSum.maxSumFromRootToLeaf + root.data;
              return new TreeSum(maxSumBetweenTwoNodesOfChildren, maxSumFromRootToLeaf);
          }
    
      # method 2: http://fenghaolw.blogspot.com/2012/11/binary-tree-maximum-path-sum.html
      #
    int maxPathSum(TreeNode *root) {
        // Start typing your C/C++ solution below
        // DO NOT write int main() function
        int csum;
        int maxsum = INT_MIN;
        maxPathSumHelper(root, csum, maxsum);
        return maxsum;
        
    }
      // csum is the sum which you want to propagate above

    void maxPathSumHelper(TreeNode *node, int &csum, int &maxsum) {
        if (!node) {
            csum = 0;
            return;
        }
        int lsum = 0, rsum = 0;
        maxPathSumHelper(node->left, lsum, maxsum);
        maxPathSumHelper(node->right, rsum, maxsum);
        csum = max(node->val, max(node->val + lsum, node->val + rsum));
        maxsum = max (maxsum, max(csum, node->val + lsum + rsum));
    }



###########################################
# largest subarray with 0's = 1's       (use cumulative sums)
# http://www.geeksforgeeks.org/archives/20586
#
# http://tech-queries.blogspot.com/2011/09/find-largest-sub-matrix-with-all-1s-not.html
    Use largest area in histogram as helper | http://goo.gl/pGG1p
    http://goo.gl/m1Lte
    http://goo.gl/pGG1p

 
# largest square sub matrix with all 1's = Dynamic prog. HW - cs580     http://www.geeksforgeeks.org/maximum-size-sub-matrix-with-all-1s-in-a-binary-matrix/

# largest rectangular submatrix with 0's = 1's    ? TODO    http://stackoverflow.com/questions/13698298/largest-submatrix-with-equal-no-of-1s-and-0s

# largest k*k submatrix with max sum (done by DP youtube vid)

# insert spaces or split a sentences into as many words as possible ( @ ggl2.cpp )

###########################################
My rule of thumb is:  POINTERS vs REFERENCES

      Use pointers if you want to do arithmetic with them or if you ever have to pass a NULL-pointer.
      Use references otherwise.
###########################################
# amazon (trick, thought)
given an ASCII string, return the longest substring with unique characters. Ex: dabcade => Ans: bcade.

###########################################
typedef vector<int> vi; 
typedef vector<vi> vvi; 
typedef pair<int,int> ii; 
#define sz(a) int((a).size()) 
#define pb push_back 
#define all(c) (c).begin(),(c).end() 
#define tr(c,i) for( typeof((c).begin()) i = (c).begin(); i != (c).end(); i++ )
#define present(c,x) ((c).find(x) != (c).end())     // use if STL has find() e.g. set/map
#define cpresent(c,x) (find(all(c),x) != (c).end())   // use with vector

###########################################
# for passing c++ vector<> to functions

    Instead, use the following construction:
         void some_function(const vector<int>& v) { // OK 
              // ... 
         } 
    If you are going to change the contents of vector in the function, just omit the .const. modifier.
         int modify_vector(vector<int>& v) { // Correct 
              V[0]++; 
         } 

# pairs < int , int >
    The great advantage of pairs is that they have built-in operations to compare themselves. Pairs are compared first-to-second element. If the first elements are not equal, the result will be based on the comparison of the first elements only; the second elements will be compared only if the first ones are equal. The array (or vector) of pairs can easily be sorted by STL internal functions. 

# The end iterator is pointing not to the last object, however, but to the first invalid object, or the object directly following the last one. It.s often very convenient. 

# To get the index of element found, one should subtract the beginning iterator from the result of find():
     int i = (find(v.begin(), v.end(), 49) - v.begin(); 
     if(i < v.size()) { 
          // ... 
     } 

# max and min in vector<>
 int data[5] = { 1, 5, 2, 4, 3 }; 
 vector<int> X(data, data+5); 
 int v1 = *max_element(X.begin(), X.end()); // Returns value of max element in vector 
 int i1 = min_element(X.begin(), X.end()) . X.begin; // Returns index of min element in vector 

 int v2 = *max_element(data, data+5); // Returns value of max element in array 
 int i3 = min_element(data, data+5) . data; // Returns index of min element in array 

# const vector shud have a const_iterator

# It gives us a simple way to get rid of duplicates in vector and sort it:  INSERT INTO set<>
   vector<int> v; 
   // . 
   set<int> s(all(v)); 
   vector<int> v2(all(s)); 
  Here 'v2' will contain the same elements as 'v' but sorted in ascending order and with duplicates removed. 

# map <int , char> info
  There is one important difference between map::find() and map::operator []. While map::find() will never change the contents of map, operator [] will create an element if it does not exist. In some cases this could be very convenient, but it's definitly a bad idea to use operator [] many times in a loop, when you do not want to add new elements. That.s why operator [] may not be used if map is passed as a const reference parameter to some function:

  'Algorithm sort() is also widely used. The call to sort(begin, end) sorts an interval in ascending order. Notice that sort() requires random access iterators, so it will not work on all containers. However, you probably won't ever call sort() on set, which is already ordered. 
'

# next_permutation
         vector<int> v; 

         for(int i = 0; i < 10; i++) { 
              v.push_back(i); 
         } 

         do { 
              Solve(..., v); 
         } while(next_permutation(all(v)); 

# Don.t forget to ensure that the elements in a container are sorted before your first call to next_permutation(...). Their initial state should form the very first permutation; otherwise, some permutations will not be checked. 


# copy vec2 to end of vec1
      // Now copy v2 to the end of v1
      v1.resize(v1.size() + v2.size()); 
      // Ensure v1 have enough space 
      copy(all(v2), v1.end() - v2.size()); 
      // Copy v2 elements right after v1 ones 

# copy vector -> set : v1 into s1
  copy (all(v1), std::inserter(s1, s1.end()));


# set intersection, union etc. (THE INPUT DATA LIST SHUD BE SORTED, HENCE DIRECTLY APPLICABLE TO SET, MAP )

        int data1[] = { 1, 2, 5, 6, 8, 9, 10 }; 
        int data2[] = { 0, 2, 3, 4, 7, 8, 10 }; 
         
        vector<int> v1(data1, data1+sizeof(data1)/sizeof(data1[0]));
        vector<int> v2(data2, data2+sizeof(data2)/sizeof(data2[0])); 
         
        vector<int> tmp(max(v1.size(), v2.size()); 
         
        vector<int> res = vector<int> (tmp.begin(), set_intersection(all(v1), all(v2), tmp.begin());


    ## Actually, I would never use a construction like ' vector<int> tmp'. I don't think it's a good idea to allocate memory for each set_*** algorithm invoking. Instead, I define the global or static variable of appropriate type and enough size. See below:

                  set<int> s1, s2; 
                  for(int i = 0; i < 500; i++) { 
                          s1.insert(i*(i+1) % 1000); 
                          s2.insert(i*i*i % 1000); 
                  } 
                   
                  static int temp[5000]; // greater than we need 
                   
                  vector<int> res = vi(temp, set_symmetric_difference(all(s1), all(s2), temp)); 
                  int cnt = set_symmetric_difference(all(s1), all(s2), temp) . temp;


# ACCUMULATE

      int sum = accumulate(all(v), 0); 
      long long sum = accumulate(all(v), (long long)0); # specify the 3rd param as LONG LONG type in case int is not sufficient 
      double product = accumulate(all(v), double(1), multiplies<double>());   # product #// don.t forget to start with 1 !


# using STL sort(), you always implement operator '<'
    Again, you should understand it in this way: "I only need to implement operator < for objects to be stored in set/map." 

# split string on ' '
      istringstream iss(input);   # make a stream of 'input' string
      vector<string> tokens;
      copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter<vector<string> >(tokens));


#########################################
# WAP to connect the level wise pointers in a full binary tree w/o using Queue
# Idea is : Assume level i next pointers are connected, that will help in connecting i+1 level.

        // Sets the nextRight of root and calls connectRecur() for other nodes
        void connect (struct node *p)
        {
            // Set the nextRight for root
            p->nextRight = NULL;
         
            // Set the next right for rest of the nodes (other than root)
            connectRecur(p);    # //PREORDER //
        }
         
        /* Set next right of all descendents of p.
           Assumption:  p is a compete binary tree */
        void connectRecur(struct node* p)
        {
          // Base case
          if (!p)
            return;
         
          // Set the nextRight pointer for p's left child
          if (p->left)
            p->left->nextRight = p->right;
         
          // Set the nextRight pointer for p's right child
          // p->nextRight will be NULL if p is the right most child at its level
          if (p->right)
            p->right->nextRight = (p->nextRight)? p->nextRight->left: NULL;
         
          // Set nextRight for other nodes in pre order fashion
          connectRecur(p->left);
          connectRecur(p->right);
        }


        # WRONG #
        class node {    // this code is for full binary tree
          node *left;
          node *right;
          node *next;
        }

        void pre(node *n, node *pn) {
          if (n) {
            n->next = (pn == 0) ? 0 : pn->right;
            if (n->next == pn->right) {
              n->next = pn->next->left;     // this line is not correct
            }
            pre (n->left, n);   // it has to be 'preorder'
            pre (n->right, n);
          }
        }

# when this is not a full binary tree; for e.g. skewed tree

Same above funda will solve the skewed tree, just that if (pn->next->left == null) then you check for (pn->next->right == null) ; if both null, then 
  you have to keep moving right using ur parents next pointer until u reach a node or lastly NULL

###########################################
# Directed acyclic word graph

This is a tree whuich u can form by compressing Trie (prefix tree). In this, prefix and suffixes are shared.


# Print all the combination from a candidate set that sum to a target value
achieved thru recursion   "subset_sum_equal_n.cpp"  OR use the dp approach given above [ isSubsetSum() ]

###########################################
Consistent hashing (used in web cacheing etc.). 
  When you add a node, in linear hashing u move around n/(n+1) amt. of data
  n => # servers

  In consistent hashing this amt. ~ 1/(n+1) 

http://www.linux-mag.com/id/7561/
The basic idea is to avoid re-hashing most keys to a new server when a server is removed or added. We do this by trying to make hash keys consistently map to the same  servers in most (but obviously not all) cases. The code required to accomplish this is a bit longer than is worth pasting here, but the theory behind it is fairly easy to describe. Instead of having a one-to-one relationship between hash “slots” and servers, in consistent hashing, each server is given a larger number of slots- say 1,000 of them. So if you want to add “serverA” to the list, behind the scenes, you end up with “serverA-0001? … “serverA-1000? on the list. Each of those names can be mapped to a 64bit number (using a hash function, of course) and stored in a sorted list (or similar data structure). The values will be semi-randomly and semi-evenly spread out in the 64bit number space.

That means instead of 10 servers and 10 slots in a hash, we actually have 10 servers mapping to total of 10,000 slots. To map a key to a server, you run that key 
through the hash function, just as before, but this time you don’t simply “mod $num_servers” to find the server. Instead, you take the resulting 64bit value and consult the sorted list. The server immediately after that number in the list is the one that is responsible for the data. So if your 64bit value was closest to the hashed value for “serverD-0532?, the server-D is your answer.

Now, here’s where the real magic happens. If you add a server to the list, that adds another 1,000 slots to the list. But instead of having to rehash all the keys, you end up with only a percentage of them moving to the new server. Similarly, if you need to remove a server from the list, you remove its 1,000 points and only a fraction of the keys and up having to map to other servers (those that lived on the removed server). Understanding Consistent Hashing provides a more visual version of this technique.


other text[]
http://www.lexemetech.com/2007/11/consistent-hashing.html
Clockwise movement: This works well, except the size of the intervals assigned to each cache is pretty hit and miss. Since it is essentially random it is possible to have a very non-uniform distribution of objects between caches. The solution to this problem is to introduce the idea of "virtual nodes", which are replicas of cache points in the circle. So whenever we add a cache we create a number of points in the circle for it.



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

######################
* convex hull simple:   http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=geometry2#convexhull

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

'
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
# code to insert a # in a string

  for (int p = 0; p<=st.length(); p++ ) {
    mod = st.substr(0, p) + "#" + st.substr(p);
    cout << "\n mod = " << mod;
    }
    '"

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

      //print all possible trees
      void output_all_possible_trees(int *seq, int n, int num1, int num0)
      {
           
           if((num1 + num0) == 2*n)
           {
              seq[2*n] = 0;
              TreeNode *root = rebuild_tree(seq, 2*n+1);
              print_tree(root);
              return;
           }
              
          if(num1 >= num0 && num1 < n)
          {
              seq[num1+num0] = 1;
              output_all_possible_trees(seq, n, num1+1, num0); 
          }       
          
          if(num0 < num1 && num1 <=n)
          {
              seq[num1+num0] = 0;
              output_all_possible_trees(seq, n, num1, num0+1);  
          
          }
         
      }


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
  for (j = 0; j <= (n - m); ++j)      // j is base
  {
    for (i = 0; i < m && x[i] == y[j + i]; ++i);
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
  if (r == p)   /*this order of 2 if {} is important*/
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

rev_bit = 0;
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
      struct node* SortedMerge(struct node* a, struct node* b) 
      {
        struct node* result = NULL;
       
        /* Base cases */
        if (a == NULL) 
           return(b);
        else if (b==NULL) 
           return(a);
       
        /* Pick either a or b, and recur */
        if (a->data <= b->data) 
        {
           result = a;
           result->next = SortedMerge(a->next, b);
        }
        else
        {
           result = b;
           result->next = SortedMerge(a, b->next);
        }
        return(result);
      }
'"/\  
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

YOU CALL ABOVE FUNCTION LIKE : rIno (root, 0);

###########################################
###########################################
# read a BST preorder string from a file and convert it to tree:
#
Remember my post: Determine if a Binary Tree is a Binary Search Tree (BST)?

We use the same idea here. We pass the valid range of the values from the parent node to its child nodes. When we are about to insert a node, we will check if the insert value is in the valid range. If it is, this is the right space to insert. If it is not, we will try the next empty space. Reconstructing the whole BST from a file will take only O(n) time.

void readBST(BinaryTree *&root, ifstream &fin) {
  int val;
  fin >> val;
  readBSTHelper(INT_MIN, INT_MAX, val, root, fin);
}

void readBSTHelper(int min, int max, int &insertVal,BinaryTree *&p, ifstream &fin) {
  if (insertVal > min && insertVal < max) {
    int val = insertVal;
    p = new BinaryTree(val);
    if (fin >> insertVal) {
      readBSTHelper(min, val, insertVal, p->left, fin);   // IF THIS FAILS, IT MEANS THAT insertVal canNOT be in left child
      readBSTHelper(val, max, insertVal, p->right, fin);
    }
  }
}

###########################################
# LCA of bt
# RMQ and LCA = http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor
#
node *LowestCommonAncestor( node *root , node *p , node *q)     // Complexity O(n)
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

# better O(N) for diameter of TREE:

                int height = 0;
                struct node *root = SomeFunctionToMakeTree();
                int diameterOpt(struct node *root, int* height)
                {
                  int lh = 0, rh = 0;

                  int ldiameter = 0, rdiameter = 0;

                  if(root == NULL)
                  {
                    *height = 0;
                    return 0; /* diameter is also 0 */
                  }

                  /* Get the heights of left and right subtrees in lh and rh
                     And store the returned values in ldiameter and ldiameter */
                  ldiameter = diameterOpt(root->left, &lh);
                  rdiameter = diameterOpt(root->right, &rh);

                  /* Height of current node is max of heights of left and
                     right subtrees plus 1*/
                  *height = max(lh, rh) + 1;

                  return max(lh + rh + 1, max(ldiameter, rdiameter));
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

# 2nd method to code:

        struct Node* sortedListToBST(struct Node *head)
        {
            int n = countNodes(head);
            return sortedListToBSTRecur(&head, n);
        }
         
        struct Node* sortedListToBSTRecur(struct Node **head_ref, int n)
        {
            if (n <= 0)
                return NULL;
         
            struct Node *left = sortedListToBSTRecur(head_ref, n/2);
            struct Node *root = *head_ref;
         
            root->prev = left;
         
            *head_ref = (*head_ref)->next;
            root->next = sortedListToBSTRecur(head_ref, n-n/2-1);
         
            return root;
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


# 2nd method by stan:
#	http://cslibrary.stanford.edu/109/TreeListRecursion.html
#
# C solution : 

typedef struct node* Node;

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

# mtd: 3:
  or you can do Inorder to make a one directional list and the reverse connect it.

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
                heap.insert( new MergesortHeapNode(tempArray[subarrayIndex[a.getWhichSubarray()]++], a.getWhichSubarray() ));

                // Increment the subarray index where the lowest element resides
                //#subarrayIndex[a.getWhichSubarray()]++;
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
Given an integer array such that every element occurs 3 times except one element which occurs only once. how to find that single element in O(1) space and O(n) time complexity?

http://www.quora.com/Algorithms/Given-an-integer-array-such-that-every-element-occurs-3-times-except-one-element-which-occurs-only-once-how-to-find-that-single-element-in-O-1-space-and-O-n-time-complexity
http://www.geeksforgeeks.org/find-the-element-that-appears-once/

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

  This is a two step process.
  1. Get an element occurring most of the time in the array. This phase will make sure that if there is a majority element then it will return that only.
  2. Check if the element obtained from above step is majority element.

// if any 2 nos. appear > n/3 times : GOOGLE interview
  # The basic idea is similar to majority-finding. In majority finding, we use the property that deleting any two distinct elements preserves majority elements, in the sense that any element that was majority before is still majority. Here, we use the property that deleting any three distinct elements preserves special elements.
  http://apps.topcoder.com/forums/?module=RevisionHistory&messageID=1464587
  http://karmaandcoding.blogspot.com/2011/12/finding-repeated-elements-in-array.html    using a hashmap of size K if we have to find N/K times

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

# construct from PRE and POST a complete/full BT  | http://www.geeksforgeeks.org/full-and-complete-binary-tree-from-given-preorder-and-postorder-traversals/
      struct node *constructTree (int pre[], int post[], int size)
      {
        int preIndex = 0;
        return constructTreeUtil (pre, post, &preIndex, 0, size - 1, size);
      }

      // preIndex is used to keep track of index in pre[].
      // l is low index and h is high index for the current subarray in post[]
      struct node* constructTreeUtil (int pre[], int post[], int* preIndex, int l, int h, int size)
      {
        // Base case
        if (*preIndex >= size || l > h)
          return NULL;

        // The first node in preorder traversal is root. So take the node at
        // preIndex from preorder and make it root, and increment preIndex
        struct node* root = newNode ( pre[*preIndex] );
        ++*preIndex;

        // If the current subarry has only one element, no need to recur
        if (l == h)
          return root;

        // Search the next element of pre[] in post[]
        int i;
        for (i = l; i <= h; ++i)
          if (pre[*preIndex] == post[i])
            break;

        // Use the index of element found in postorder to divide postorder array in
        // two parts. Left subtree and right subtree
        if (i <= h)
        {
          root->left = constructTreeUtil (pre, post, preIndex, l, i, size);
          root->right = constructTreeUtil (pre, post, preIndex, i + 1, h, size);
        }

        return root;
      }

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
      //cout << curr->data;
    }
		else
			break;
	}
}

## MS interview: write a class Inorder iterator

class Itr {
private:
  node *r;
  Stack<node*> S;

public:
  Itr(node *n) : r(n) {
    node *curr = r;
    _fillStack (curr);
  }

  bool hasNext {
    return !S.IsEmpty();
  }

  int getNext() {
    node *top = S.top();
    S.pop();
    int ret = top->data;
    top = top->right;
    _fillStack(top);
    return ret;
  }

  void _fillStack (node* curr) {
    while (curr) {
      S.push (curr);
      curr = curr->left;
    }
  }

};

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
# Idea of Topological Sorting: Run the DFS on the DAG and output the vertices in reverse order of finishing time.
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

    // the bottom half is sorted, AND key is in that region
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



public int rotatedSearch(int[] values, int start, int end, int x){
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
{ 
  // Actual path finder v != w.
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
    u = NextVertex(v);
  }
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
         u = NextVertex(i);
         }
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
         if (!InDegree[u]) 
          S.Add(u);
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
         for each vertex u, 
          set visited[u] := false;
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

          # Finding a cycle#
          # TODO: modify this to get the nodes in the cycle
          bool dfs (int v, L[]) {
            L[v] = GREY;

            int u = begin(v);
            while (u) {
              if (L[u] == GREY)  {
                // pop from stack 'Cycle' till u get node u
                return TRUE;
              }

              else if (L[u] == WHITE) {
                Cycle.push (u);
                  if (dfs (u, L[]))
                    return TRUE;
                Cycle.pop();
              }
              u = next(v);
            }   // end while
            
            L[u] = BLACK;
            return FALSE;
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
        reach[u] = label;
      } // mark reached
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


# two sigma question about wildcard matching using '?' and '*'
#     http://www.glassdoor.com/Interview/TWO-Sigma-Interview-RVW1827179.htm

bool isMatch (const char *t, const char *g) {
  if (*t == '\0' && *g == '\0')
    return true;
  else if ( *t == '\0' || *g == '\0')
    return false;
  else if (*t == *g || *g == '?')
    return isMatch (t+1, g+1);
  else if (*g == '*') {
    int limit = strlen(t);
    for (int eat = 0; eat <= limit; eat++)
      if (isMatch(t+eat, g+1))
        return true;
  }
}

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

# Ques 1:
N=4, Coins = {1,2,3}; with infinite supply | table can be 1D or 2D    | http://www.geeksforgeeks.org/dynamic-programming-set-7-coin-change/

        Given a value N, if we want to make change for N cents, and we have infinite supply of each of S = { S1, S2, .. , Sm} valued coins, how many ways can we make the change? The order of coins doesn’t matter.
        For example, for N = 4 and S = {1,2,3}, there are four solutions: {1,1,1,1},{1,1,2},{2,2},{1,3}. So output should be 4. For N = 10 and S = {2, 5, 3, 6}, there are five solutions: {2,2,2,2,2}, {2,2,3,3}, {2,2,6}, {2,3,5} and {5,5}. So the output should be 5.

        # Just give no. of ways. Not the min. # of coins
        Let count(S[], m, n) be the function to count the number of solutions, then it can be written as sum of count(S[], m-1, n) and count(S[], m, n-Sm).

        # 2D table 
        table[n+1][m]     answer is table[n][m-1]     // always initialize base case
        int count( int S[], int m, int n )
        {
            int i, j, x, y;
         
            // We need n+1 rows as the table is consturcted in bottom up manner using
            // the base case 0 value case (n = 0)
            int table[n+1][m];
            
            // Fill the enteries for 0 value case (n = 0)
            for (i=0; i<m; i++)
                table[0][i] = 1;
         
            // Fill rest of the table enteries in bottom up manner 
            for (i = 1; i < n+1; i++)
            {
                for (j = 0; j < m; j++)
                {
                    // Count of solutions including S[j]
                    x = (i-S[j] >= 0)? table[i - S[j]][j]: 0;
         
                    // Count of solutions excluding S[j]
                    y = (j >= 1)? table[i][j-1]: 0;
         
                    // total count
                    table[i][j] = x + y;
                }
            }
            return table[n][m-1];
        }
 
        # 1D
        int count( int S[], int m, int n )
        {
          // table[i] will be storing the number of solutions for
          // value i. We need n+1 rows as the table is consturcted
          // in bottom up manner using the base case (n = 0)
          int table[n+1];

          // Initialize all table values as 0
          memset(table, 0, sizeof(table));

          // Base case (If given value is 0)
          table[0] = 1;

          // Pick all coins one by one and update the table[] values
          // after the index greater than or equal to the value of the
          // picked coin
          for(int i=0; i<m; i++)
            for(int j=S[i]; j<=n; j++)
              table[j] += table[j-S[i]];

          return table[n];
        }

# coin denonimation problem: Return min. no. of coins which can give u 'amount' Rs. with infinite repetion
# complexity = nW
# W is the width or max. amt. of weight a knapsack can have
# infinite supply of coins
#####
        int coins( int[] coins, int amount ) {
          int[] table = new int[amount+1];

          Arrays.fill( table, Integer.MAX_VALUE - 100 );
          table[0] = 0;

          for ( int i = 1; i < table.length; i++ ) {    // running amount u need
            for ( int j = 0; j < coins.length; j++ ) {
              if ( coins[j] <= i ) {                    // if that coin value can be considered
                table[i] = MIN (table[i], table[i - coins[j]]+1);
              }
            }
          }
          return table[amount];
        }

https://docs.google.com/file/d/18Ls8SnBofO3daV0VNn7-OHCQWEw_1nDmvvwy27qsGME0TO5SbkF9Auz6kowf/edit
Compute the Value of the Optimal Solution Bottom-up. Consider the following piece of pseu-docode, where d is the array of denomination values, k is the number of denominations, and n is the amount for which change is to be made.

C[p] = { 0        if p=0
       { min forall d[i]<=p { 1 + C[p-d[i] }

Change(d, k, n)
  C[0] = 0
  for p = 1 to n
    min = INFINTY
    for i = 1 to k
      if d[i] <= p then
        if 1 + C[p - d[i]] < min then
          min = 1 + C[p - d[i]]
          coin = i
    C[p] = min
    S[p] = coin
  return C and S

# what coin denomination are used ?
Make-Change(S, d, n)
 while n > 0
  Print S[n]
  n = n - d[S[n]]


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

0-1 Knapsack Algorithm

    for w = 0 to W
      B[0,w] = 0
    for i = 1 to n    //items
      B[i,0] = 0

    for i = 1 to n
      for w = 0 to W
        if w[i] <= w // item i can be part of the solution
           B[i,w] = MAX (bi + B[i-1,w- wi] , B[i-1, w]);
        else B[i,w] = B[i-1,w] // wi > w

-------------------------
0-1 KNAPSACK SOLN.

Here is a dynamic programming algorithm to solve the 0-1
Knapsack problem:

Input: S, a set of n items as described earlier, W the total
weight of the knapsack. (Assume that the weights and values
are stored in separate arrays named w and v, respectively.)

B[k, w] = B[k - 1,w],             if w[k] > w
        = max { B[k - 1,w], B[k - 1,w - w[k]] + v[k]}


Output: The maximal value of items in a valid knapsack.

      int w, k;
      for (w=0; w <= W; w++)
      B[w] = 0

      for (k=0; k<n; k++) {   // items
        for (w = W; w>= w[k]; w--) {    // weigth

          if (B[w - w[k]] + v[k] > B[w])
            B[w] = B[w - w[k]] + v[k]

        }
      }



# 
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

# verify the corectly parenthesized ?
Given a string with only ')' and '(' find if the string is complete or not. If the string is complete means that each open paranthesis should have a corresponding closed one. Eg: String s= "((()))()"- Complete String String s1=")()()()())))(()()()((" - Incomplete String 
    # use a simple counter. +1 for ( -1 for ) . Anytime, if counter < 0 ; return false;

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

  } //for()

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

##################
void nCk_recursive(string actual, string result, int start, int end, int k)
{
 if(result.length() == k) {
   cout << result << endl; return;
 }
 for(int i = start; i < end; ++i) {
   string temp = result;
   temp += actual[i];
   nCk_recursive(actual, temp, i+1, end, k);
 }
}

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
    if( (int)used[str[i]] != 0)
    {
      continue;
    }

    used[str[i]] = 1;

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
            //Calculating Li
            while (!St.empty())
            {
              if(arr[i] <= arr[St.top()])     // stack will always contain the lowest height seen to left from bar[i]
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

            St.push(i);                     // IMP step
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
# Number of inversions in an Array:   @ http://www.geeksforgeeks.org/counting-inversions/
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

1:
Solution: This is a relatively simple DP problem. Here we only give the main idea.
- For a particular bar bi, if we know the highest bar on its left Li and highest bar on its right Ri.  If the height of bi is smaller than both Li and Ri, the water volume can be held on this bar is min(Li, Ri) - hi; otherwise, it can't hold water.
- To calculate Li and Ri, we just need to record the maximum height we had observed so far from the left (and from the right). Therefore, a O(n) algorithm is straightforward here.

2:
http://sumitpal.wordpress.com/2012/08/17/histogram-based-water-volume-calculation-algorithm/#comment-223
  based on divide and conquer
  apply simple area of rec.

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

# Method 5 ( Optimized Method 4 )   @geeksforgeeks
# The method 4 can be optimized to work in O(Logn) time complexity. We can do recursive multiplication to get power(M, n) in the prevous method (Similar to the optimization done in this post)

1 1 ^ n = f(n+1) f(n)
1 0       f(n)   f(n-1)

        void multiply(int F[2][2], int M[2][2]);
        void power(int F[2][2], int n);
         
        /* function that returns nth Fibonacci number */
        int fib(int n)
        {
          int F[2][2] = {{1,1},{1,0}};
          if(n == 0)
            return 0;
          power(F, n-1);
          return F[0][0];
        }
         
        /* Optimized version of power() in method 4 */
        void power(int F[2][2], int n)
        {
          if( n == 0 || n == 1)
              return;
          int M[2][2] = {{1,1},{1,0}};
         
          power(F, n/2);
          multiply(F, F);
         
          if( n%2 != 0 )
             multiply(F, M);
        }
         
        void multiply(int F[2][2], int M[2][2])
        {
          int x =  F[0][0]*M[0][0] + F[0][1]*M[1][0];
          int y =  F[0][0]*M[0][1] + F[0][1]*M[1][1];
          int z =  F[1][0]*M[0][0] + F[1][1]*M[1][0];
          int w =  F[1][0]*M[0][1] + F[1][1]*M[1][1];
         
          F[0][0] = x;
          F[0][1] = y;
          F[1][0] = z;
          F[1][1] = w;
        }
         
        /* Driver program to test above function */
        int main()
        {
          int n = 9;
          printf("%d", fib(9));
          getchar();
          return 0;
        }

#http://www.ics.uci.edu/~eppstein/161/960109.html
############################################################

# Readers-Writers problem (M : M) | preference to READERS
        semaphore wrt=1,mutex=1;
        readcount=0;
        writer()
        {
            wait(wrt);
              //writing is done
            signal(wrt);
        }
         
        reader()
        {
            wait(mutex);
            readcount++;
            if(readcount==1)
                wait(wrt);
            signal(mutex);

            ///Do the Reading
            ///(Critical Section Area)

            wait(mutex);
            readcount--;
            if(readcount==0)
               signal(wrt);
            signal(mutex);
        }

# Giving preference to Writers:

        int readcount, writecount; (initial value = 0)
        semaphore mutex_1, mutex_2, mutex_3, w, r ; (initial value = 1)
         
        READER
          wait(mutex_3);
            wait(r);
              wait(mutex_1);
                readcount := readcount + 1;
                if readcount = 1 then wait(w);
              signal(mutex_1);
            signal(r);
          signal(mutex_3);
         
          reading is performed
         
          wait(mutex_1);
            readcount := readcount - 1;
            if readcount = 0 then signal(w);
          signal(mutex_1);
         
         
        WRITER
          wait(mutex_2);
            writecount := writecount + 1;
            if writecount = 1 then wait(r);
          signal(mutex_2);
         
          wait(w);
            writing is performed
          signal(w);
         
          wait(mutex_2);
            writecount := writecount - 1;
            if writecount = 0 then signal(r);
          signal(mutex_2);

# No starvation:
#
        semaphores: no_waiting, no_accessing, counter_mutex ( initial value is 1 ) 
        shared variables: nreaders ( initial value is 0 ) 
        local variables:  prev, current
 
WRITER:
        P( no_waiting );
        P( no_accessing );
        V( no_waiting );
          ...  write ...
        V( no_accessing );
 
READER:
        P( no_waiting );
          P( counter_mutex );
            prev := nreaders;
            nreaders := nreaders + 1;
          V( counter_mutex );
          if prev = 0  then P( no_accessing );
        V( no_waiting );
        ... read ...
        P( counter_mutex );
          nreaders := nreaders - 1;
          current := nreaders;
        V( counter_mutex );
        if current = 0 then V( no_accessing );

# Bounded buffer producer/consumer
        # 'in' points to empty slot, and if out is next, then its FULL
        #
        while(1) {    #prod
          /* make item */
          while(((in +1)%BUFFER_SIZE == out)  /* do nothing */;
            buffer[in]=nextProduced;
            in = (in+1)%BUFFER_SIZE;
          }

          while(1) {    #consumer
            while(in == out) /* do nothing */;
            nextConsumed = buffer[out];
            out = (out+1)%BUFFER_SIZE; 
            /* consume item */
          }


        semaphore fillCount = 0; // items produced
        semaphore emptyCount = BUFFER_SIZE; // remaining space
         
        procedure producer() {
            while (true) {
                item = produceItem();
                down(emptyCount);
                    putItemIntoBuffer(item);
                up(fillCount);
            }
        }
         
        procedure consumer() {
            while (true) {
                down(fillCount);
                    item = removeItemFromBuffer();
                up(emptyCount);
                consumeItem(item);
            }
        }

 ########################################
 #cisco

// delete from link list 
// a given value
// there can be multiple nodes of that value

node* delete (node *n, int x)
{
  if (!n)
    return 0;

    // leave first node and check others
  node *p=n->next, *pp=n;

  while (p) {
    if (p->data == x) {
      pp->next = p->next;
      delete p;
      p = pp->next;
    }
    else {
      pp = p;
      p = p->next;
    }
  }

  // check head once;
  if (n->data == x) {
    n = n->next;
  }

  return n; // n can be zero or valid node*
}

# sort a link list bubble or merge

#for (int i=0; i<n; i++)
#for (int j=0; j<n-1; j++)
#  if(a[j] > a[j+1])
#    swap (a, j, j+1);

node *llsort (node  *n) {
  //margesort
  if (!n)
  return 0;

  node *left = llsort (n);
  node *right = llsort (getMid(n));
  return SortedMerge (left, right);
}

node *getMid (node *n) {
  if (!n)
  return 0;
  else if (n->next)
  return n;

  slow = n, fast = n;

  while (fast || fast->next) {
    slow = slow->next;
    fast = fast->next->next;
  }
  return slow;
}
 

###########
#PING
###########

Everybody knows that the ping utility is used to check network connectivity between two hosts, but what happens when a user issues a ping? This article is designed to explain the basics of what happens on a network when a ping is issued. Imagine the following scenario;

You have PC-A in subnet 192.168.1.0/24, PC-B in subnet 192.168.2.0/24 and a router connected to both subnets. You need to check if PC-A can connect to PC-B.


For the purposes of this article we will use the following IP addresses and MAC addresses;

PC-A 
192.168.1.10	MAC Address	00:00:00:00:00:10	
Default Gateway	192.168.1.15

Router Interface E0 
192.168.1.15 MAC Address	00:00:00:00:00:15

Router Interface E1 
192.168.2.20	MAC Address	00:00:00:00:00:20

PC-B 
192.168.2.25	MAC Address	00:00:00:00:00:25
Default Gateway	192.168.2.20

A user on PC-A types in “ping 192.168.2.25”

The first thing to happen is that ICMP (Internet Control Management Protocol) creates data. This is just the alphabet. IP (Internet Protocol) on PC-A creates a packet containing the Destination IP Address (192.168.2.25), the Source IP Address (192.168.1.10), the data, and a protocol field. The protocol field informs the receiving host where to pass the data to, in this example the protocol field would be set to 0x1h to indicate ICMP. (0x indicates that the following is an hexadecimal number)

Once the packet has been created ARP (Address Resolution Protocol) is then used to identify the MAC (Media Access Control / Hardware address / Burned Address) address of the destination host. This can happen in a number of ways, the first to happen is that ARP checks it’s cache to see if it has a match to the Destination IP Address. If not then ARP sends out an ARP broadcast to the Ethernet MAC broadcast address (FF:FF:FF:FF:FF:FF)

“Who has 192.168.2.25? Please tell 000000000010”

You will notice that PC-A is asking for replies to be sent to the MAC address. This is because computers communicate only with MAC addresses on LANs (Local Area Networks)

If no response is received by PC-A, then ARP & IP assume that 192.168.2.25 is on a remote subnet and therefore would require routing. At this point the IP address and the MAC address of the default gateway is required. In a Windows machine the registry is consulted in order to get the IP address of the default gateway (192.168.1.15). ARP then consults it’s cache to see if it has match to the IP address of the default gateway, if not then another ARP broadcast is sent

“Who has 192.168.1.15? Please tell 000000000010”

Because this is a broadcast ALL hosts on the 192.168.1.0/24 subnet will receive this frame. The router interface E0 will read the frame and identify itself as the interface with the requested IP address. The router will then reply;

“I have 192.168.1.15. MAC address is 000000000015”

As the request asked for a reply direct to PC-A the frame sent from the router will be directed towards PC-A and not sent as a broadcast. The router will also cache the MAC address of PC-A, which it received via the broadcast sent by ARP to locate the MAC address of the router.

Once IP at PC-A as received the message from the router interface it will pass the packet created earlier and the MAC Destination address down to the Data Link Layer. 

The Data Link Layer creates a frame containing the Destination MAC address, the Source MAC address, A FCS (Frame Check Sequence, used to verify the data has not been corrupted) and an Ether_Type field, in this example the field will be set to 0x8 to indicate IP. This Frame encapsulates the packet passed down from IP at the Network Layer. The MAC address of the router is also cached into the ARP cache on PC-A

Once the frame has been created it is passed down to the Physical Layer where the frame is placed onto the wire one bit at a time. Every host on subnet 192.168.1.0/24 will receive this frame, build it, and check the Destination MAC address, if it is not a match the frame is discarded. At the router interface, E0, the Destination MAC address is a match. The router then checks the Ether_Type field (0x8 = IP) pulls the packet from the frame, discards the frame and passes the packet up to IP at the Network Layer. 

At the Network Layer the Destination IP address is checked to see if it is a match, in this example the Destination IP address is 192.168.2.25, however the IP address of the router interface which received the frame is 192.168.1.15, and is not a match. The router then consults it’s routing table for the destination IP network address (192.168.2.0). If there is no match in the routing table the packet is discarded and a “Destination Network unavailable” message is returned to PC-A

If there is a match in the routing table then the router will switch the packet to the interface configured to send information to the destination IP Network Address, in this example E1.

Interface E1 now needs to know the MAC address of the machine with IP address 192.168.2.25. The first thing it does is check the ARP cache, no match in the cache, E1 then send out an ARP broadcast.

“Who has 192.168.2.25? Please tell 000000000020”

Because PC-B is on the same subnet as E1, PC-B responds

“I have 192.168.2.25. MAC address is 0000000025”

IP at Interface E1, on the router, then passes the packet (created at PC-A) and the Destination MAC address for 192.168.2.25 down to the Data Link Layer. The Data Link Layer then creates a frame containing the Destination MAC address, Source MAC address, FCS and an Ether_Type field (again set to 0x1h to indicate IP), which encapsulates the IP packet. 
(The MAC address of PC-B is placed into the ARP cache on Interface E1, and the MAC address of interface E1 is placed into the cache of PC-B)

The frame is then passed down to the Physical Layer to be placed on the wire one bit at a time. Again all hosts on the 192.168.2.0/24 subnet will receive the frame, build it, check it, discard it with the exception of PC-B which will match the Destination MAC address. PC-B will then check the Ether_Type field, pull the packet from the frame, discard the frame and pass the packet to the protocol indicated in the Ether_Type field, in this example IP. 

IP then checks the Destination IP address in the packet and finds a match. It will then check the Protocol field (0x1h = ICMP) and pass the data to ICMP. ICMP recognises that the data sent is an echo request, and will then create an echo response message.

The echo response is then passed to IP, which will then build a packet, consisting of the Destination IP address (192.168.1.10), the Source IP address (192.168.2.25) the data from ICMP, and the protocol field. Once the packet is built the MAC address of the IP address 192.168.1.10 is required. ARP checks it’s cache, if there is no match an ARP broadcast is sent.

“Who has 192.168.1.10? Please tell 000000000025”

Because 192.168.1.10 is on a remote subnet, and routers do not pass broadcasts there is no response. 

The default gateway is then required for PC-B. The default gateway is configured as 192.168.2.20 and the ARP cache is checked. As PC-B cached the MAC address of interface E1, a match is found and there is no need to send out an ARP broadcast.

Now that the MAC address of the default gateway has been resolved the packet and the Destination MAC address is then passed down to the Data Link Layer.

At the Data Link Layer a frame is built which consists of the Destination MAC address, the Source MAC address, the FCS and the Ether_Type field (again set to 0x8 to indicate IP). The frame encapsulates the packet passed down from IP. The complete frame is then passed down to the Physical Layer to be put onto the wire one bit at a time.

At Interface E1 of the router, the frame is received, the Destination MAC address is then checked and found to be a match. The Ether_Type field is then checked, the packed is pulled from the frame, the frame is discarded and the packed passed to IP, as indicated in the Ether_Type field.

IP on E1 checks the IP destination address and finds it is not a match. It then consults the routing table for the IP Network Address (192.168.1.0/24), if a match is found the packet is switched to the Interface configured for the 192.168.1.0/24 network, in this example E0.

If no match is found then the packet is discarded. PC-A will receive a time-out error in this case, as the time set to receive replies has been exceeded. A destination network unavailable message is NOT sent to PC-A. If the message could be sent to PC-A then the router would obviously have a route to PC-A’s network and then would not need to generate the message!!

On Interface E0, the interface configured for 192.168.1.0/24, IP and ARP will then locate the MAC address for the IP address 192.168.1.10. ARP checks the cache, because the MAC address for PC-A was cached on the outgoing trip, there is a match and the packet and frame are then passed down to the Data Link Layer. 

The Data Link Layer will then build a frame, consisting of the Destination MAC address, the Source MAC address, Ether_Type field and the FCS. This frame encapsulates the packet passed down from IP and then passes the frame down to the Physical Layer to be placed onto the wire, one bit at a time.

PC-A receives the frame sent from interface E0 on the router, checks the MAC address, finds a match, reads the Ether_Type field, pulls the packet from the frame, discards the frame and passes the packet to IP as indicated in the Ether_Type field. IP checks the Destination IP address and finds a match. IP will then read the Protocol field (0x1h = ICMP) and passes the data to ICMP.

ICMP recognises the data as an echo response, ICMP acknowledges receipt by sending information to the user interface, (“!” with Cisco routers, “Reply from 192.168.2.25…….” and additional information in Windows), and then builds another echo request and the whole process begins again.

The above is designed to give an overview of what happens on the network when data is sent from one machine to another. This is by no way to be considered complete as there are additional parameters which can be configured and created both within the IP packet and the Data-Link Frame. The above assumes the use of Ethernet_II frames on the network. No matter how big the network or how many routers the data passes through the process is identical to the above.

## 
