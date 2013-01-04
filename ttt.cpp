do{
       while(current!=NULL){
           pushStack(&stackTop,current);
           current=current->left;
       }
       if(!isEmptyStack(stackTop)){
           current=popStack(&stackTop);

           if(current->right==NULL){
               printf("\n%d",current->info);
               current=current->right;
           }
           else{
               if(current->isVisited==true){
                   printf("\n%d",current->info);
                   current=NULL;
               }else{
                   current->isVisited=true;
                   pushStack(&stackTop,current);
                   current=current->right;
               }
           }

       }        // if
    } while(!isEmptyStack(stackTop) || current!=NULL);

while (!stack.isEmpty()) {
	       while (cur != null) {
		   if (cur.left_ != null) {
		       cur = cur.left_;
		       stack.push(cur);
		   }else{
		       break; //break loop
		   }
	       }
	       cur = stack.peek();
	       if (cur.right_ != null && last != cur.right_) {
		   cur = cur.right_;
		   stack.push(cur);
	       } else {
		   stack.pop();
		   s += cur.value_+", ";
		   last = cur;
		   cur = null;
	       }

	   }

public static String postOrderNoflag(Node root) {

   String s = "";
   Stack<Node> stack = new Stack<Node>();
   Node last = null;
   Node cur = root;

   stack.push(root);

   while (!stack.isEmpty()) {
       while (cur != null) {
           if (cur.left_ != null) {
               cur = cur.left_;
               stack.push(cur);
           }else{
               break; //break loop
           }
       }
       cur = stack.peek();
       if (cur.right_ != null && last != cur.right_) {
           cur = cur.right_;
           stack.push(cur);
       } else {
           stack.pop();
           s += cur.value_+", ";
           last = cur;
           cur = null;
       }

   }
   return s;
}

