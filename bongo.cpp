/* smaple model of prg. for bongo game ...
 * http://www.careercup.com/page?pid=amazon-interview-questions
 */

class Position {
	public:
	int x;
	int y;
};

char fill [N*N];
char M[N][N];
char blocked[N+1][N+1];
bool visited [N+1][N+1];

for (int i=1;i=N;i++) {
	for (int j=1;j=N;j++) {
		blocked [i][j] = M[i-1][j-1];
	}

for (int i=0 ; i< N+1;i++) {
	blocked [0][i] = '-';
	blocked [i][0] = '-';
	blocked [N][0] = '-';
	blocked [i][N] = '-';
}

for (int i=0;i=N;i++) 
	for (int j=0;j=N;j++) 
		visited [i][j] = false;

for (int i=0 ; i< N+1;i++) {
	visited [0][i] = true;
	visited [i][0] = true;
	visited [N][0] = true;
	visited [i][N] = true;
	}
}

in main {
	Position p (1,1);
	visited (p.x.y) = true;
	print_words (p, 0);
}

//Queue <Position> Q;
static Position offsets [8] = { /* all 8 options */   };

void print_words (Position start, int fillptr) {
	// start with 'start'
	// find possible nbrs, store them in Q or stack
	// move to a possible nbr, make visited = True
	// find if its a word and print
	// start recusion here
	// decrement the fillptr
	//visited [start.x][start.y] = true;
	fill[fillptr] = blocked [start.x][start.y];
	fill[fillptr+1] = '\0';
	// chek if this is a word in dict

	for (int which_nbr = 0 ; which_nbr < 8 ; which_nbr++) {
		Position nbr = start + offset[which_nbr];
		if ( visited [nbr.x][nbr.y] == true)
			continue;
		//else
		visited [nbr.x][nbr.y] = true;
		print_words ( nbr, fillptr+1);
		visited [nbr.x][nbr.y] = false;
	}
}
