$sentence = "This is a perl tutorial by Abhinav Singh at http://abhinavsingh.com";  
  
#~ Matching $sentence for 'Abhinav Singh'  
$sentence =~ m/Abhinav Singh/i;  
  
print "Pre-Match: ".$`."\n";  
print "Match: ".$&."\n";  
print "Post-Match: ".$'."\n";  

