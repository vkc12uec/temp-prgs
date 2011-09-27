
int sprintf (char *arr, int len, const char *fmt , ...)
{
	//int fmtlen = strlen (fmt);
	va_list vl;
	va_start (vl, fmt);	// retrive afterwards
	c=0;
	for (int i=0; i< strlen(fmt) ;i++) {
		if (fmt[i] != '%')
			arr[c++]=fmt[i];
		else {
			i++;
			switch (fmt[i]) {
			case 'd':
			int d = va_arg(vl, int);
			// convert int to char
			break;
			case 'c':
			char d = va_arg(vl, char);
			break;
			case 's':
			strcpy (temparr, va_arg(vl, char*));
			break;
			case 'f':
			// do
			break;
			}
		}


	}

}

