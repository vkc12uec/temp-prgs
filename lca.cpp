

node *LCA (node *r, node *p, node *q) {
  if (!r)
    return 0;

  if (
    r->left == p || 
    r->left == q || 
    r->right == p || 
    r->right == q )
    return r;

  l1 = LCA (r->left, p, q)
  l2 = LCA (r->right, p, q)

  if (l1 || l2)
    return r;
  else {
    node *n = (l1 == null)? l2 : l1;
    return n;
  }
      
}
