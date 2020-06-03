package TMS::API::Feature::Business;
use Moose;

use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::Entity;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::EntBusiness'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( [ 'ent_carrier', 'entity' ] );
}

1;
