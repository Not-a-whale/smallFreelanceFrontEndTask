package TMS::API::Types::Complex;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;

use Moose;
use Moose::Util::TypeConstraints;
use TMS::API::Types::Objects;
use TMS::API::Types::Tools;

our $AUTO_GENERATE = 0;
$Data::Dumper::Terse = 1;

sub _auto_ok { $AUTO_GENERATE && (!defined $_[0] || $_[0] !~ /\S+/s) ? 1 : 0 }

sub _build_types {
    my ($class, $input) = @_;
    my $results = [];
    my $trait   = $class . TMS::API::Types::Tools::Chained();
    foreach my $item (@$input) {
        if (ref($item) eq $class) {
            push @$results, $item;
        } elsif (ref($item) eq 'HASH') {
            push @$results, $class->with_traits($trait)->new(%{$item});
        } else {
            confess "Unable to coerce type \"" . ref($item) . "\" as \"$class\" reference";
        }
    }
    return $results;
}

TYPESPLACEHOLDER
1;
