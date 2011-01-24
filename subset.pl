#!/usr/bin/perl

my ($activity, $cal);
my %act_cal=();

open (FH, "<data.txt") or die "Cant open input file, $!";
while (<FH>) {
	chomp $_;
	#print "\n[$_]";
	($activity, $cal)=split(" ", $_);
	#print "\n
	$act_cal{$activity} = $cal;
}

my ($P, $N)=(0,0);
foreach $value (values %act_cal) {
	if ($value < 0) { $N+=$value; }
	else { $P+=$value; }
}

print "\nP=$P, N=$N";

my %sumtuples=();

foreach $key (keys %act_cal) {
	print "\nouter key = $key";
	if ( scalar keys %sumtuples == 0) {
		$sumtuples{$key} = $act_cal{$key};
		print "\n sumtuples birth ";
		next;
	}
	#&prnthash(%sumtuples);
	print "\n current sumtuples has = ";
	foreach $k (keys %sumtuples) {
		print "\n $k -----> $sumtuples{$k}";
	}

	foreach $key1 (keys %sumtuples) {
		my $temp = $sumtuples{$key1} + $act_cal{$key};
		print "\n temp = $temp, key = $key , key1 = $key1 ";

		#if ($temp < N || $temp > P) { 
		#	print "\nnext1";
		#	print "\n$temp, $N, $P";
		#	exit;
		#	next;
		#}

		if ($temp == 0) {
			print "\nrequired key = ".join("##", $key1,$key);
		}

		$newkey =  join("##", $key1,$key);
		$sumtuples{$newkey}  = $temp;
	}
	$sumtuples{$key} = $act_cal{$key};
}	# foreach act_cal hash

print "\n --------------------- ";
foreach $key (keys %sumtuples) {
	print "\n $key -> $sumtuples{$key}";
}
print "\n";
exit;

####################################################################

sub prnthash(){
	my %hash=();
	my $ref = shift;
	%hash = %$ref;
	
	foreach $k (keys %hash) {
		print "\n$k -> $hash{$k}";
	}
}
