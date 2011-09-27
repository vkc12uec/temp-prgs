#include<stdio.h>

int min (int a, int b, int c) {
	int m = (a>b) ? b : a;
	m = (m>c) ? c : m;
	return m;
}

int findNthUgly( int N )
{
    int idx=2;
    int p2,p3,p5;
    
    p2=1,p3=1,p5=1;
    
    int DP[N+2];
    
    DP[1]=1;
    
    while( idx <=N )
    {
           
       DP[idx]=min( DP[p2]*2 , DP[p3]*3 , DP[p5]*5 );
       
       if( DP[idx]==DP[p2]*2 )
        p2++ ;
        
       else if( DP[idx]==DP[p3]*3 )
        p3++ ;
        
       else if( DP[idx]==DP[p5]*5 )
        p5++ ;
        
       
       idx++ ;
       
       }
       
   
   return DP[N] ;
   
}


int main () {
	printf ("\n%d", findNthUgly(1500));
}
