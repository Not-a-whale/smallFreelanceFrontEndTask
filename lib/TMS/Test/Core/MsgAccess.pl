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
use v5.28.1;

use TMS::Test::Core::MsgAccess;

use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;
use TMS::API::Types::Columns;

$TMS::API::Types::Simple::AUTO_GENERATE  = 1;
$TMS::API::Types::Objects::AUTO_GENERATE = 1;
$TMS::API::Types::Complex::AUTO_GENERATE = 1;
$TMS::API::Types::Columns::AUTO_GENERATE = 1;

my $inst = TMS::Test::Core::MsgAccess->with_traits('TMS::API::Core::MsgAccessStrict')->new();
say Dumper($inst);
$inst->Create;
$inst->Tell(undef);
