#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

my $long_string = "very big big Big big big Stringgggg";

say "Length of string: ", length $long_string;

printf("Long is at %d \n", index $long_string, "big"); #index finds location of first occurance of specified string/char

printf("Last g is at %d \n", rindex $long_string, "g"); #rindex finds last occurance

$long_string = $long_string . ' but kinda isn\'t';

say $long_string;

say "Index 7 through 15: ", substr $long_string, 7, 9;

my $animal = "animals";

printf("Last character is %s \n", chop $animal); #chop deletes last index and returns it

say $animal;

my $no_newline = "No Newline\n";
printf($no_newline);
say "hi";
chomp $no_newline;  #chop deletes one newline from string
printf($no_newline);
say "hi";

printf("Uppercase %s \n", uc $long_string);
printf("Lowercase %s \n", lc $long_string);
printf("1st Uppercase %s \n", ucfirst $long_string); #lcfirst is also available

$long_string =~ s/ /, /gi; #replace all occurances of space with comma followed by space
#g makes sure all occurances get checked, i ignores case of character being checked

say $long_string;

my $two_times = "What I said is " x 2;
say $two_times;

my @array_letters = ('a' .. 'z');

my @array_num = (1 .. 15);

say $array_num[1]; #if asking for one value of array, use scalar version with $

print join(", ", @array_letters), "\n";

my $letter = 'z'; # next letter after z == aa
say "Next Letter ", ++$letter;
