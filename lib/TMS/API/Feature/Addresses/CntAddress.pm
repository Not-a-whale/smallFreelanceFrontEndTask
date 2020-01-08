package TMS::API::Feature::Addresses::CntAddress;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Core::CntAddress;
use TMS::API::Joins::Addresses;
extends 'TMS::API::Feature::Features';

has coreapi  => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TMS::API::Core::CntAddress');
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub _build_prefetch { shift->prefetch(TMS::API::Joins::Addresses->new->prefetch) }

1;
