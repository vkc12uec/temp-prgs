/*
   code for a simple TRIE data structure ...
 */

package dsa.tries;

import java.util.Collection;
import java.util.LinkedList;

/**
 * @author Braga
 */
public class Node {
	char content;
	boolean marker; 
	Collection<Node> child;

	public Node(char c){
		child = new LinkedList<Node>();
		marker = false;
		content = c;
	}

	public Node subNode(char c){
		if(child!=null){
			for(Node eachChild:child){
				if(eachChild.content == c){
					return eachChild;
				}
			}
		}
		return null;
	}
}

public void insert(String s){
	Node current = root; 
	if(s.length()==0) //For an empty character
		current.marker=true;
	for(int i=0;i<s.length();i++){
		Node child = current.subNode(s.charAt(i));
		if(child!=null){ 
			current = child;
		}
		else{
			current.child.add(new Node(s.charAt(i)));
			current = current.subNode(s.charAt(i));
		}
		// Set marker to indicate end of the word
		if(i==s.length()-1)
			current.marker = true;
	} 
}

public boolean search(String s){
	Node current = root;
	while(current != null){
		for(int i=0;i<s.length();i++){    
			if(current.subNode(s.charAt(i)) == null)
				return false;
			else
				current = current.subNode(s.charAt(i));
		}
		/* 
		 * This means that a string exists, but make sure its
		 * a word by checking its 'marker' flag
		 */
		if (current.marker == true)
			return true;
		else
			return false;
	}
	return false; 
}
}

