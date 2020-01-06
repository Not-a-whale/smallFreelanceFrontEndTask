#!/usr/bin/env perl
END { print "\nAll done. Press ENTER to exit. "; <STDIN>; }
BEGIN {
    use Cwd 'abs_path';
    use File::Basename;
    my $cur = abs_path(dirname(abs_path($0)));
    (my $lib = $cur) =~ s/\/lib\/.*/\/lib/;
    push @INC, ($cur, $lib);
}

use strict;
use warnings FATAL => 'all';
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;
use Carp;

use TMS::API::Joins::BusinessBranchesAndBilling;
my $obj = TMS::API::Joins::BusinessBranchesAndBilling->new;
print Dumper($obj->prefetch);

