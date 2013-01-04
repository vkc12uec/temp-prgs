#include <iostream>
using namespace std;


// replace all space in string with %20
// read from right and stuff in %20

int main () {
    char str[] = " i am a good boy";
    int n = strlen (str);
    
    int count_spaces = 0, i = 0;
    char *c = &str[0];

    while (*c != 0) {
          if (*c == ' ')
             count_spaces++;
          c++;
          }
    #if 0
    while (i<n){
          if (str[i] == ' ')
             count_spaces++;
          i++;
          }
    #endif
    cout << "\n no. of spaces = "<< count_spaces;   // OK
    
    int newlen = n + (3*count_spaces);
    char *newstr = new char [newlen];
    
    int read = 0 , fill = 0;

    while (read < n) {
    	if (str[read] != ' ') {
    		newstr[fill++] = str[read];
    	}
    	else {
    		newstr[fill++] = '%';
    		newstr[fill++] = '2';
    		newstr[fill++] = '0';
    	}
    	read++;
    }
    cout << "\n new str  = "<< newstr ;             //OK
       
    system("pause");
    return 0;
}
