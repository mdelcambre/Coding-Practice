#!/usr/bin/env perl
use strict; use warnings;
use Data::Dumper qw(Dumper);

my $COUNT = 0;

my @board = (
    [1,0,0,0,1],
    [0,0,0,1,0],
    [0,0,0,0,1],
    [-1,0,0,0,-1]
);


sub allowed_moves {
    my @place = @{ $_[0] };

    my $vowel = $board[$place[0]][$place[1]];

    my @moves = (
        [-2,1],
        [-2,-1],
        [-1,2],
        [-1,-2],
        [1,2],
        [1,-2],
        [2,1],
        [2,-1]
    );

    my @valid_moves = ();
    foreach my $move (@moves) {
        my $x = $place[1] + ${ $move }[1];
        my $y = $place[0] + ${ $move }[0];
        if ( $x < 0 || $x >4 || $y < 0 || $y > 3) {
            next;
        } elsif ( $board[$y][$x] == -1 ) {
            next;
        }
        push @valid_moves, [$y,$x];
    }
    return ($vowel,\@valid_moves);
}



sub itterate_moves {
    my ($length,$vowels,$placeref) = @_;

    $length++;

    my ($is_vowel,$movesref) = allowed_moves($placeref);

    if ($is_vowel == 1) {
        $vowels++;
    }

    my @moves = @{ $movesref };

    if ($vowels > 2) {
        return;
    }

    if ($length == 10) {
        $COUNT++;
        return;
    }

    foreach my $move (@moves) {
        itterate_moves($length,$vowels,$move);
    }
}

for (my $y=0;$y <= 3;$y++){
    for (my $x=0;$x <= 4; $x++){
        if ($board[$y][$x] == -1){
            next;
        }
        itterate_moves(0,0,[$y,$x]);
    }
}

print "$COUNT\n";





#my %keypad = (
#    'a' => [1,'h','l'],
#    'b' => [0,'i','m','k'],
#    'c' => [0,'j','n','l','f'],
#    'd' => [0,'o','m','g'],
#    'e' => [1,'n','h'],
#    'f' => [0,'c','m','one'],
#    'g' => [0,'d','n','two'],
#    'h' => [0,'e','o','three','one','k','a'],
#    'i' => [1,'two','l','b'],
#    'j' => [0,'three','m','c'],
#    'k' => [0,'b','h','two'],
#    'l' => [0,'a','c','i','three'],
#    'm' => [0,'b','d','j','f'],
#    'n' => [0,'c','e','one','g'],
#    'o' => [1,'d','two','h'],
#    'one' => [0,'f','h','n'],
#    'two' => [0,'g','i','o','k'],
#    'three' => [0,'h','j','l']
#);







