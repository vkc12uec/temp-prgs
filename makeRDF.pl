#!/usr/bin/perl

# script to extrace entities from a labelled file
# each line would be of form:

# feature1 feature2 feature3 ..... term tag
# extract last 2 fields

my $filename;
my %entity = ();				# entitites -> names

if (scalar (@ARGV) == 1){
	$filename = shift;
}

#print "\nname = $filename";

# NNP INE FIRSTCAP HYPHENATED R-fluoxetine b-api 
# if we want to extract the syntactic information, u need to get the syntactic infomatino b/w 2 full-stops.
# That way u can look at what kind of entity is there and arrange for a definite subject/predicate order

	open FILE, "<$filename" or die $!;

	while (<FILE>){
		chomp ($_);
		#print "\n[$_]";
		$lasttwo =  get_last_two ($_);
		#print "\n[$lasttwo]";
		$lasttwo =~ m/(.*)#(.*)/;
		#print "\n1=[$1]	2=[$2]";
		#$entity{$2}=$1;						# b-api => R-fluoxetine

		# make like inverted index hash
		if (exists $entity{$2} ){
			$array_ref = $entity{$2};
			push (@$array_ref, $1);			# duplicates #1 like R-fluoxetine in other files will also be there
		}
		else {
			my @array = ();
			push(@array, $1);
			$entity{$2}=\@array;
		}
	}

	for $k (keys %entity){
		prnthash ($k, $entity{$k});
	}
print "\n";
exitmain();	

sub get_last_two (){
	#print "\nhello";
	my $line = shift;
	print $line."\n";
	my @terms = split (" ", $line);
	my $n = scalar (@terms);

    foreach $k (@terms){
       #myprnt ($k);
    }

#exit;#
	#myprnt ($terms[$n-1]);
	#myprnt ($terms[$n-2]);
#exit;
	my $ret = $terms[$n-2]."#".$terms[$n-1];
	#print "\nret = [$ret]";
#exit;
	return $ret;

	#foreach $k (@terms){
	#	myprnt ($k);
	#}
}

sub prnthash(){
	my $key = shift;
	my $value = shift;		# this can be an array

	print "\n$key => [".join(" ", @$value)."]";
}

sub myprnt(){
	my $word = shift;
	print "\n{$word}";
}

sub exitmain (){
	exit;
}
