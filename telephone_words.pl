# taken from telephone_words.cpp

%keymap = (
	2 => {
		1=>'a',
		2=>'b',
		3=>'c',
		},
	3 => {
		1=>'d',
		2=>'e',
		3=>'f',
		},
	4 => {
		1=>'g',
		2=>'h',
		3=>'i',
		},
	5 => {
		1=>'j',
		2=>'k',
		3=>'l',
		},
	6 => {
		1=>'m',
		2=>'n',
		3=>'o',
		},
	7 => {
		1=>'p',
		2=>'r',
		3=>'s',
		},
	8 => {
		1=>'t',
		2=>'u',
		3=>'v',
		},
	9 => {
		1=>'w',
		2=>'x',
		3=>'y',
		},
);

#print $keymap{2}{1};

# print combinations for 234
@phone = (2,3,4);
@combi = ();

print $keymap{$phone[1]}{1};
print $keymap{$phone[1]}{2};
print $keymap{$phone[1]}{3};
#exit;

filler (0);
print "\n here 1";

exit;

sub filler {
	my $index = shift;
	#print "\n grand index  = $index";
	if ($index == 3) {
		print "\n".join (" ", @combi);
		return;
	}

	for (my $i=1;$i<4;$i++) {
		#push @combi, $keymap{$phone[$index]}{$i};
		$combi[$index] = $keymap{$phone[$index]}{$i};
		filler ($index+1);
		#print "\n index = $index , val = $keymap{$phone[$index]}{$i} i = $i";
	}
}
