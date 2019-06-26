#Coding along to Perl Tutorial found here: https://www.youtube.com/watch?v=WEghIXs8F6c :)
use strict; #used for error messages
use warnings;
use diagnostics;

use feature 'say';

use feature "switch";

use v5.30.0; #Version number used

use lib 'Perl';

use Animal::Cat;   #MAKE SURE IT CAN FIND DIRECTORY

my $whiskers = new Animal::Cat("ozzy", "Evan");

say $whiskers->getName();

$whiskers->setName("Ozzy");

say $whiskers->getName();

say $whiskers->getSound();

use Animal::Lion;

my $king = new Animal::Lion("Simba", "No One");

say $king->getSound();
