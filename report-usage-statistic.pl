#!/usr/bin/perl

my %s;  
while (<>) { 
	next unless $_ =~ /report=/ ; 
	$_ =~ /GET \/welltime\/\?module=statistic&report=(\w*)&/; 
	$s{ $1} += 1; 
}
for my $i (sort { $s{$a} <=> $s{$b} } keys %s ) { 
	print "$i => $s{$i}\n"; 
} 
