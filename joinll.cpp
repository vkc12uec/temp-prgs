#include <iostream>
#include <stdio.h>
#include <string.h>
#include "malloc.h"

using namespace std;

struct node{
	int n;
	node *next;
};

node * init (char *p);
node * join (node *p, node *q);
void printl (node* n);

int main (){
	char a[]="abcd";		//{1,2,3,4,5};
	char b[]="pqrstuv";			//{1,2,3,4,5};
	node *l1=init(a);
	node *l2=init(b);

	printl(l1);
	printl(l2);
	node *joint=  join (l1,l2);
	printl(joint);

	return 0;
}

node * join (node *n1, node*n2)
{
	node *p=n1;
	node *h=p;
	n1=n1->next;
int i=0;

	while (n1 && n2){
		if (i%2 ==0){
			p->next = n2;
			p=n2;
			n2=n2->next;
		}
		else {
            p->next = n1;
            p=n1;
            n1=n1->next;
		}
	i+=1;
	}
	if (!n1)
		for(; n2; p->next = n2, p=n2, n2=n2->next);

	if (!n2)
		for(; n1; p->next = n1, p=n1, n1=n1->next);

	return h;
}

void printl (node* l){
	while(l){
		printf (": %d",l->n);
		l=l->next;
		}
printf ("\n");
}

node * init (char *p){
	node *temp, *pp, *h;
	int i=0,len=strlen(p);

printf ("\n p=[%s]", p);

	temp=(node*) malloc (sizeof (node));
	if (!temp)
		printf ("\n u r doom");
	h=temp;
	temp->n=int(p[0]);
	temp->next=0;
	
	pp=temp;
//	p++;

	for (i=1;i<len;i++){
		temp=(node*) malloc (sizeof (node));
		printf ("\n char = %c",p[i]);
		temp->n=(int)p[i];
		temp->next=0;
		pp->next=temp;
		pp=temp;
//		p++;
	}
	return h;
}
