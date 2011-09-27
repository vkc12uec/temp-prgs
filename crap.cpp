
#include <stdio.h>
#include <iostream>
#include <iomanip>

// code for wire routing ... sartaj

bool label  (int a[][], int m) {
	id = 1;
				Position here, nbr;
	for (i=0;i<m;i++) {
		for (j=0;j<m;j++) {
			id++;
			if (a[i][j] == 1) {
				a[i][j] = id;
				here.x = i, here.y = j;
				}

			while (1) {
				for (k=0;k<4;k++) {
					nbr.x =here.x + offset[k].x;
					nbr.y =here.y + offset[k].y;

					if (a[nbr.x][nbr.y] == 1) {
						a[nbr.x][nbr.y] = id;
						Q.add (nbr);
						}
				}
				if (!Q.isEmpty())
					Q.Delete(here);
				else 
					break;
			}


			}
		}
	}
}

do{    	 while(current!=NULL){    		 
			pushStack(&stackTop,current);    		 
			current=current->left;    	 
			}    	 
			if(!isEmptyStack(stackTop)){    		 
			current=popStack(&stackTop);    		 
			if(current->right==NULL){    			 
			printf("\n%d",current->info);    			 current=current->right;    		 }    		 else{    			 if(current->isVisited==true){    				 printf("\n%d",current->info);    				 current=NULL;    			 }else{    				 current->isVisited=true;    				 pushStack(&stackTop,current);    				 current=current->right;    			 }    		 }    	 }     }while(!isEmptyStack(stackTop) || current!=NULL);



using namespace std;
class Test
{
public:
    int data;
    //virtual void fun1()
    void fun1()
    {
        cout << "Test::fun1" << endl;
    }
};
class dTest : public Test
{
public:
    //int c;
};

int main() 
{
    Test obj1;
    cout << "obj1's Size = " << sizeof(obj1) << endl;
    cout << "obj1's Address = " << &obj1 << endl;
    dTest obj2;
    cout << "obj2's Size = "<< sizeof(obj2) << endl;
    cout << "obj2's Address = "<< &obj2 << endl;
    return 0;
}

#if 0
{
int array[4]={10,20,30,40};
int *tmp=array;
for (int i=0;i<4;i++)
{
tmp+=sizeof(int);
printf("%d\n",*tmp);
}
//getch();
return 0;
}
#endif

/*
class A {
   int a;
   void show(){ int i = 0;};
};
int main()
{
 A *obj = new A();
 printf("\n object size = %d", sizeof(A));
 return 0; 
}
*/

# if 0
char *mystrcpy(char *, const char *);

int main () {

char *v="vivek", d[10], *dd;

dd = mystrcpy (d, v);

printf ("\ndd = %s",dd);

return 0;
}

char *mystrcpy(char *dst, const char *src)
{
char *ptr;
ptr = dst;
while(*dst++=*src++);
return(ptr);
}
#endif
