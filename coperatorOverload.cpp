#include <stdio.h>

typedef struct s{
	int x;
	int y;
	}cc;

cc operator+(cc a, cc b){
	cc temp;
	temp.x=a.x+b.x;
	temp.y=a.y+b.y;
	return temp;
}

int main (){
	cc a={5,4}, b={4,4}, d;
	d=a+b;
	printf ("\n d.x | d.y = %d | %d", d.x, d.y);

return 0;
}
