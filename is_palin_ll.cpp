//Posted by mail2maulish on January 10, 2011 

bool isPalin (node *n) {

	int len, i, j, k;
	node *mid, *once, *twice, *t;

	once=head;
	len=0;
	while (once) {
		len++;
		once = once->next;
		}

	mid=len/2; t=head;

	node *parent_midhead=0;
	while (mid) { mid--;	parent_midhead=t; t=t->next; }
		
	midhead = t;		// parent_midhead

	if (len & 1)	// odd
		perfect=1; 
	else
		perfect=0;

	// if even u have to consider midhead node too in reversing.

	//  break link list from midhead
	parent_midhead->next=0;
	newhead = reverse(head);

	lineacheckEachValue (newhead, midhead->next);

	//reverse again	
	oldhead = reverse (newhead);
	parent_midhead->next = midhead;

}
