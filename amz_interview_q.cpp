
/*
+-files/
  +-target/
  | +-file1.xml
  | +-file2.jar
  | +-file3.txt
  | +-classes/
  |   +-src/
  |   | +-Delete.java
  |   | +-DeleteTest.java
  |   | +-pom.xml
  |   +-usr/
  |     +-bin/
  |     | +-cat.exe
  |     +-blah.jpg
  +-build.xml
*/

#include "topcoder_header.h"

void dent (int indent) {
  for (int i=0; i<indent; i++)
    cout << " ";
}

int getdir (string dir, vector<string> &files)
{
  DIR *dp;
  struct dirent *dirp;
  if((dp  = opendir(dir.c_str())) == NULL) {
    cout << "Error(" << errno << ") opening " << dir << endl;
    return errno;
  }

  while ((dirp = readdir(dp)) != NULL) {
    files.push_back(string(dirp->d_name));
  }
  closedir(dp);
  return 0;
}

bool DirectoryExists( const char* pzPath )
{
  if ( pzPath == NULL) return false;

  DIR *pDir;
  bool bExists = false;

  pDir = opendir (pzPath);

  if (pDir != NULL)
  {
    bExists = true;    
    (void) closedir (pDir);
  }

  return bExists;
}

void tree (string s, int indent, string parent) {
  dent(indent);
  cout << s;
  cout << "\n";

  vs lfiles(0);

  if (parent=="")
    parent="./";

  if (getdir(parent+"/"+s, lfiles)) {
    cout << "\n What the hell";
    return ;
  }

  tr (lfiles, it) {
    if (*it == "." || *it == "..")
      continue;
    
    //cout << "\n"<< *it;

    string fpath = parent + s+"/"+ (*it);

    if (DirectoryExists (fpath.c_str())) {
      //cout << "\n recusive calling it =" << *it<<" s= "<< s;
      tree (*it , indent+2, s);
    }
    else {
      dent(indent+2);
      cout << *it;
      cout << "\n";
    }
  }
}

int main () {
  string s="files";

  tree (s, 0, "");
  return 0;
}
