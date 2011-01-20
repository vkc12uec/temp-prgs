#include <cstdio>
    #include <iostream>
    
    using namespace std;
    
    #define SWAP(A, B) {struct tempStruct { char C[sizeof(A)];} swap_tmp;\
    swap_tmp = *( struct tempStruct*) &A;\
    *( struct tempStruct*) &A = *( struct tempStruct*) &B;\
    *( struct tempStruct*) &B = swap_tmp;}
    
    int main () {
        
        char v1 = 'a';
        char v2 = 'b';    
        SWAP (v1, v2);
        cout << v1 << "   " << v2 <<"\n";
    
        float f1 = 45;
        float f2 = 123;
        SWAP (f1, f2);
        cout << f1 << "   " << f2 <<"\n";
    }
