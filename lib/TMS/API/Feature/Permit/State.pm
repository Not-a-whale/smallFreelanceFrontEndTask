package TMS::API::Feature::Permit::State;
use Moose;

use TMS::API::Core::CrrPermitAccount;
use TMS::API::Core::CrrPermitAccountDoc;
use TMS::API::Core::GenFile;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::CrrPermitAccountDoc'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( [ 'crr_prmt_acc', 'crr_prmt_acc_doc' ] );
}

1;
