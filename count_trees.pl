# code to print the no. of structurally diff binary trees 
# with n nodes

# recursion = 
# f(n) = summation over k = [1....n-1] (f(k) * f(n-k))

$n = shift @ARGV;

$count = fn ($n);
print "\ncount = $count";
exit;

sub fn {
	$n = shift;

	if ($n == 0) {
		return 0;
	}
	elsif ($n==1) {
		return 1;
	}
	elsif ($n==2) {
		return 2;
	}
	
	$k = 0;
	for ($i=1; $i<=($n-1) ; $i++) {
		$k = $k + ( fn($i) * fn($n-$i) );
	}
	return $k;
}
