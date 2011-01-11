

void print ( node *p){
	if (!p) return ;
	cout << p->data;
	print ( p->next);
}
