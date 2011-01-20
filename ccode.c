#include <stdio.h>
#include "malloc.h"

struct node {
  int x;
  struct node *next;
};

int main()
{

//enum Days{Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday};
//Days{Tuesday} = 14;

  struct node *root;      // This will be the unchanging first node

  root = (struct node*) malloc (sizeof (struct node));		//new node; // Now root points to a node struct
  root->next = 0;  // The node root points to has its next pointer
                   //  set equal to a null pointer
  root->x = 5;     // By using the -> operator, you can modify the node
                   //  a pointer (root in this case) points to.
return 0;
}

