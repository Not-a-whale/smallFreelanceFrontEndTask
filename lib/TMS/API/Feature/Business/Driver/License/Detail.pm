package TMS::API::Feature::Business::Driver::License::Detail;
use Moose;

use TMS::API::Core::DrvCdlEndorsement;
use TMS::API::Core::DrvDriverlicence;
use TMS::API::Core::GenFile;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::DrvDriverlicence'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( [ 'dr_lc_endorsement', 'photo' ] );
}

1;
