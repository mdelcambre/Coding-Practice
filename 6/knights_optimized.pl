#!/usr/bin/env perl
###############################################################################
# This provides the program to complete with General Programming Problem      #
# provided by Market Track. Given a keypad, generate all possible 10 key      #
# sequences through non-wrapping 'knight' moves and that contain at most 2    #
# vowels.                                                                     #
#                                                                             #
# The program first computes all valid moves from each key. The results are   #
# stored in a hash, based on the key value.                                   #
# Second the program recursively itterates through the branches of the        #
# possible moves.                                                             #
#                                                                             #
# Author: Mark Delcambre                                                      #
# email: mark@delcambre.com                                                   #
# (C) 2014                                                                    #
# License: Apache v2                                                          #
#                                                                             #
# status: prototype                                                           #
###############################################################################
use strict; use warnings;

# Define some global varriables for use in the functions below
my $COUNT = 0;
my %keypad;

# Define the board, used to generate the valid moves.
# OOB is used to defined the invalid places within the rectangle
my @board = (
    ['a','b','c','d','e'],
    ['f','g','h','i','j'],
    ['k','l','m','n','o'],
    ["OOB",'one','two','three',"OOB"]
);

# These are all possible knight moves
my @knight_moves = (
    [-2,1],
    [-2,-1],
    [-1,2],
    [-1,-2],
    [1,2],
    [1,-2],
    [2,1],
    [2,-1]
);


# Function: generate_moves
# Takes y and x to be used with @board as arguments.
# Precomputes the valid moves to store in %keypad.
# each spot is stored with the letter as the key and an array as the value.
# The first element of the array is 1 or 0 depending on if it is a vowel.
# The rest of the array are the keys of the valid moves from this spot.
sub generate_moves {

    my ($y1,$x1) = @_;
    my @valid_moves = ();
    my $letter = $board[$y1][$x1];

    # checks if $letter is a vowel, if so, we push 1 to the array
    # if not we push 0
    if ($letter =~ /^[aeiou]$/){
        push @valid_moves, 1;
    } else {
        push @valid_moves, 0;
    }

    # Itterate over all the possible knight moves
    foreach my $move (@knight_moves) {
        my $x2 = $x1 + ${ $move }[1];
        my $y2 = $y1 + ${ $move }[0];
        # check if the move falls out of the board or is marked 'OOB'
        # skip if invalid
        if ( $x2 < 0 || $x2 >4 || $y2 < 0 || $y2 > 3) {
            next;
        } elsif ( $board[$y2][$x2] eq "OOB" ) {
            next;
        }
        # we have a valid move, push the letter/key onto the list
        push @valid_moves, $board[$y2][$x2];
    }
    # asign the list of values to the key.
    $keypad{$letter} = \@valid_moves;
}


# Funciton: itterate_moves
# Takes the current length, the current number of vowels, and list of moves as
# arguments.
# The function first checks vowels and length, and updates the necessary
# varriables. Then it itterates through all of the valid moves stored in the
# hash generated above.
sub itterate_moves {

    my ($length,$vowels,$movesref) = @_;
    my @moves = @{ $movesref};

    $length++;

    # Check if this letter is a vowel
    if ($moves[0] == 1 ) {
        $vowels++;
    }
    # Check if we have too many vowels, if so terminate now
    if ($vowels > 2) {
        return;
    }

    # We have reached the target length with a valid string, add to the global
    # and terminate this branch.
    if ($length == 10) {
        $COUNT++;
        return;
    }

    # recursively call itself with each of the moves from this location
    for (my $i =1;$i <= $#moves;$i++) {
        itterate_moves($length,$vowels,$keypad{$moves[$i]});
    }
}

# Generate all the moves from each location.
# double nested for loop hits each location on the borad and calls
# generate_moves
for (my $y=0;$y <= 3;$y++){
    for (my $x=0;$x <= 4; $x++){
        # some spots are out of bounds within the board, check for this.
        if ($board[$y][$x] eq "OOB"){
            next;
        }
        generate_moves($y,$x);
    }
}

# Itterate through each starting move, calling the itterate moves function
foreach my $key (keys %keypad){
    itterate_moves(0,0,$keypad{$key});
}

# All done, print the global $COUNT
print "$COUNT\n";


