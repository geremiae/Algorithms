#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

# FALSE defintions for perl: undef, 0, 0.0, "", "0"
#CONDITIONALS
my $age = 22;
my $not_intoxicated = 1;
my $last_exam = 16;

if($age < 17) {  #conditionals pretty similar to other languages
  say "You can't drive";
} elsif(!$not_intoxicated) {
  say "You can't drive";
} else {
  say "You can drive!";
}

if(($age >= 1) && ($age < 16)) {
  say "You can't drive";
} elsif(!$not_intoxicated) {
  say "You can't drive";
} elsif(($age >= 20) && (($age > 100) || (($age - $last_exam) >5))) {
  say "You can't drive";
} else {
  say "You can drive!";
}

# COMPARISON OPERATORS FOR STRINGS: eq, ne, lt, le, gt, ge

if('a' eq 'b') {
  say "a equals b";

} else {
  say "a doesn't equal b";
}

unless(!$not_intoxicated) { #unless is opposite of if
  say "Good job!";
}

say (($age > 18) ? "Can Vote" : "Can't Vote"); #Turnary operator

#LOOPS
for(my $i = 0; $i <10; $i++) {
  say $i;
}
my $j = 1;
while($j < 10) {
  if($j % 2 == 0) {
    $j++;
    next; #skip back to begining of loop
  }
  if($j == 7) {last;} #last == break in java, python, etc
  say $j;
  $j++;
}

my $lucky_num = 6;
my $guess;

do {
  say "Guess a Number between 1 and 10";
  $guess = <STDIN>;
} while $guess != $lucky_num;

say "Congrats!";

my $age_old = 28;
given($age_old){
  when($_ > 16) {
    say "Drive";
    continue; #look for more when's
  }
  when($_ >17){say 'Go Vote';}
  default {say "Nothing Special"}
}
