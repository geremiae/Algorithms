#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

my @primes = (2, 3, 5, 7, 11, 13, 17);

my @my_info = ("Evan", "444 blah blah St", 22, 6.3);

$my_info[4] = "Geremia";

for my $info (@my_info) {
  say $info;
}

foreach my $num (@primes) {
  say $num;
}

for (@my_info) {
  say $_; #if no variable declared can use $_ to cycle through array
}

my @my_name = @my_info[0, 4];
print join(" ", @my_name), "\n";

my $items = scalar @my_info;
say $items; #length of array

my ($f_name, $address, $how_old, $height, $l_name) = @my_info;

say "$f_name $l_name";

say "Popped Value ", pop @primes; #take off 17 from array and return it

say "Pushed Value", push @primes, 17; #put 17 back on and return size of array

say "First Item ", shift @primes; #return first item from array and

say "Unshifted Item", unshift @primes, 2; #add value back to array and return size

print join(", ", @primes), "\n";

say "Remove Index 0-2 ", splice @primes, 0, 3; #remove first 3 elements of array and return them

print join(", ", @primes), "\n";

print join " ", ('list', 'of', 'words', "\n");

my $customers = "Billy Cobby Doo";
my @cust_array = split / /, $customers;

print join(", ", @cust_array), "\n";

@cust_array = reverse @cust_array;

print join(", ", @cust_array), "\n";

@cust_array = sort @cust_array;

print join(", ", @cust_array), "\n";

@cust_array = reverse sort @cust_array;

print join(", ", @cust_array), "\n";

my @number_array = (1 .. 8);

my @odds_array = grep {$_ % 2} @number_array; #very useful

print join(", ", @odds_array), "\n";

my @dbl_array =  map {$_ * 2} @number_array; #also useful, perform function on all elements of array
print join(", ", @dbl_array), "\n";
