package TMS::API::Feature::FEATURECLASSNAME;
use Moose;

DEPENDENCIES

extends 'TMS::API::Feature::Features';

has coreapi  => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TMS::API::Core::COREAPINAME');
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub _build_prefetch { shift->prefetch( PREFETCHDATA ) }

1;
