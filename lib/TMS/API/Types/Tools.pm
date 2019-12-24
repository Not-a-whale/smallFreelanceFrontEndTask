package TMS::API::Types::Tools;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

sub Chained {
    my $lvl = 1;
    my $rle = 'Strict';    # default role is STRICT
    my ($pkg, $sub);
    do {
        ($pkg, $sub) = (CORE::caller($lvl))[0, 3];
        #    printf STDERR "      %3d: %s -> %s\n", $lvl, $pkg, $sub;
        $rle = 'Search' if $pkg eq 'TMS' && $sub =~ /^TMS::API::Feature::.*?Search$/;
        $lvl++;
    } while (!($pkg eq 'Dancer2::Core::Route' || $pkg eq 'main'));
    #printf STDERR "   TRAIT: $rle\n";
    return $rle;
}

1;
