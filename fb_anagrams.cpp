
//Given a collection of words, return a collection of anagrams found in the
//given collection

typedef vector<string> vs;
typedef vector< vs* > vvs;
typedef map<string, vs*> msi;

vvs collectAnagrams (vs vec) {
  
  msi counts;

  tr (vec, it) {
    string sorted = sort(it->begin(), it->end());

    if (present(counts, sorted))
      counts[sorted].pb(*it);
    else {
      vs *v = new vs(0);
      vs.pb(*it);
      counts[sorted] = v;
    }
  }

  vvs ret;

  tr (counts, it) {
    ret.pb(*it);
  }

  return ret;
}
