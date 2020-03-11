package TMS::API::Feature::Test::AllDrivers;
use Moose;

use TMS::API::Core::DrvDriver;
use TMS::API::Core::EntPerson;
use TMS::API::Core::HrAssociate;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::DrvDriver'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( [ { 'driver' => ['ast_driver'] } ] );
}

1;
