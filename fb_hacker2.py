def func(token, c):
	if (len(token) <= c):
		return token
	else:
		return func(token[0:len(token)/2], c) + func(token[len(token)/2]+1, len(token), c)

inputstr='this is a short sentence'
tokens=[]
newtokens=[]
tokens=inputstr.split()
c=1
for token in tokens:
	print '-->'+token+'--'
	newtokens.append(func(token,c))
	c+=1
