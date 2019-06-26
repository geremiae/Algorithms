#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

my $emp_file = 'Example.txt';

open my $fh, '<', $emp_file #< means read only, $fh is the file handler
  or die "Can't Open File : $_"; #error message

while(my $info = <$fh>) {
  chomp($info); #gets rid of newline character

  my ($emp_name, $job, $id) = split /:/, $info; #get info split by each :

  print "$emp_name is a $job and has the id $id\n";
}

close $fh or die "Couuldn't Close File : $_";

open $fh, '>>', $emp_file #appending data to file
  or die "Can't Open File : $_"; #error message

print $fh "Mark:Manager:136\n"; #writing data to file

close $fh or die "Couuldn't Close File : $_";

open $fh, '+<', $emp_file #read and write
  or die "Can't Open File : $_"; #error message

seek $fh, 0, 0; #move to beginning of file

print $fh "Mae:Teacher:100\n"; #writing data to file

close $fh or die "Couuldn't Close File : $_";
