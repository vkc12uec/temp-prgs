# given any string , insert 'ns' spaces in it , and return as tuples

Set glob = []

Set getMe (string str, int ns) {
	if (ns == 0) 	return;
	len = strlen (str);

	for (int i=1; i<=strlen(str-1); i++) {
		string w1 = str.substring(0,i);
		Set temp = getMe (substring(i+1, len), ns-1);
		temp.shift (w1);
		glob.push (temp);
	}
}

