#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

#print "Hello World\n";

say "10 + 28 = ", 10 + 28;  #all basic math functions available
say "10 - 28 = ", 10 - 28;
say "10 * 28 = ", 10 * 28;
say "10 / 28 = ", 10 / 28;
say "10 % 28 = ", 10 % 28; #modulus
say "10 ** 4 = ", 10 ** 4; #Power


say "EXP 4 = ", exp 4; # e^4
say "HEX 15 = ", hex 15; #convert from hex
say "OCT 100 = ", oct 100; #convert from oct
say "INT 10.99 = ", int(10.99); #truncate value
say "LOG 4 = ", log 4; #4^e
say "Random between 3 - 17 = ", int(rand 15) + 3;
say "SQRT 45 = ", sqrt 45;

# +=, -=, *=, /= all available
my $num = 5;
say "num: ", ++$num;
# number++ (print number, then increment)
# ++number (increment, then print num)
#"number--, --number"
