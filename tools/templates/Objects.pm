package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;

$Data::Dumper::Terse = 1;

use Moose;
use Moose::Util::TypeConstraints;
use TMS::API::Types::Tools;

sub _build_type {
    my ($class,$input) = @_;
    my $trait = $class . TMS::Types::Tools::Chained();
    return $class->with_traits($trait)->new(%$input);
}

TYPESPLACEHOLDER
1;
