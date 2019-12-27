package TMS::API::Feature::Telecom::CntPhonesfax;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Core::CntPhonesfax;

extends 'TMS::API::Feature::Features';

has coreapi => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TMS::API::Core::CntPhonesfax');
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub _build_prefetch { shift->prefetch(undef) }

1;
