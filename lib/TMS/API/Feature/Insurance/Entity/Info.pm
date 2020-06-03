package TMS::API::Feature::Insurance::Entity::Info;
use Moose;

use TMS::API::Core::EntBusiness;
use TMS::API::Core::GenFile;
use TMS::API::Core::InsPolicy;
use TMS::API::Core::InsToEntity;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::InsToEntity'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [ { 'ins' => [ 'ins_provider', 'proof_of_insurance' ] } ] );
}

1;
