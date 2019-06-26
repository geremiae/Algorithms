#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

my $first_name = 'Evan'; #Scalar, an individual piece of data, put anything inside

my ($age, $street) = (22, '444 Blah Blah Dr'); #Example

my $my_info = "$first_name lives on \"$street\"\n"; #Using example

$my_info = qq{$first_name lives on "$street"\n}; #same thing as the previous line, just using qq{}

print $my_info;

my $lots_of_info = <<"END"; #Long string
this is a
bunch of information
on so so
so so
so so so
many
linnnnn
nesss
END

say $lots_of_info; #another way to print strings

my $big_int = 18446744073709551615; #biggest number possible

# for printf use %c for char, %s for string, %d for decimal, %u for unsigned int, %f for float, and %e for float in scientific notation

printf("%u \n", $big_int +10000); #won't go up any further

my $big_float = .2000340045219991;
printf("%.16f \n", $big_float + $big_float); #Up to 15 digits of percison

my $too_precise = .200000000000000013245345345; #not precise
printf("%.20f \n", $too_precise + $too_precise);

my $first = 1;
my $second = 2;

($first, $second) = ($second, $first); #swapping values

say "$first $second";
