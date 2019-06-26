#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

my %employees = ( #can also put a comma instead of arrow
"Sue"=>35,
"Billy"=>43,
"Joe"=>89
);

printf("Sue is %d \n", $employees{Sue});

$employees{Frankie} = 44;

while (my ($k, $v)=each %employees){print "$k $v\n"}

my @ages = @employees{"Sue", "Joe"}; #@employees gets just values, %employees gets keys and values

say @ages;

my @hash_array = %employees; #convert hash into array
print join(" ", @hash_array), "\n";

delete $employees{'Joe'};
while (my ($k, $v)=each %employees){print "$k $v\n"}

say ((exists $employees{'Billy'}) ? "Billy is here" : "No Billy"); #check if key exists

for my $key (keys %employees) {
  if($employees{$key} == 43) {
    say "Hi Billy!";
  }
}

#subroutines (functions)


sub get_random {
  return int(rand 11);
}

say "Random Number ", get_random();

sub get_random_max {  #pass in argument and assign it with @_
  my ($max_num) = @_;
  $max_num ||= 11;
  return int(rand $max_num);
}

say "Random Number ", get_random_max(78);

sub get_sum {  #assign multiple variables
  my ($num_1, $num_2) = @_;
  $num_1 ||= 1;
  $num_2 ||= 1;
  return $num_1 + $num_2;
}

say "Sum: ", get_sum(56, 67);

sub sum_many { #assign many variables
  my $sum = 0;
  foreach my $val (@_) {
    $sum += $val;
  }
  return $sum;
}
say "Sum: ", sum_many(1, 2, 3, 4, 5, 6, 7, 8);

sub increment { #use state to save value in subroutine
  state $execute_total = 0;
  $execute_total++;
  say "Executed $execute_total times";
}
increment();
increment();

sub double_array { #pass in array
  my @num_array = @_;
  $_ *= 2 for @num_array;
  return @num_array;
}

my @rand_array = (1 .. 5);

print join(", ", double_array(@rand_array)), "\n";

sub get_mults{ #assign values to variables
  my ($rand_num) = @_;
  $rand_num ||= 1;
  return $rand_num *2,  $rand_num * 3;
}

my ($dbl_num, $trip_num) = get_mults(3);

say "$dbl_num $trip_num";

sub factorial { #recursion
  my($num) = @_;
  return 0 if $num <= 0;
  return 1 if $num == 1;
  return $num * factorial($num-1);
}
say "Factorial of 10 = ", factorial(10);
