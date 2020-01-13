package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;

use Moose;
use Moose::Util::TypeConstraints;
use TMS::API::Types::Tools;

our $AUTO_GENERATE = 0;
$Data::Dumper::Terse = 1;

sub _auto_ok { $AUTO_GENERATE && (!defined $_[0] || $_[0] !~ /\S+/s) ? 1 : 0 }

sub _build_type {
    my ($class, $input) = @_;
    my $trait = $class . TMS::API::Types::Tools::Chained();
    return $class->with_traits($trait)->new(%$input);
}

TYPESPLACEHOLDER
1;
