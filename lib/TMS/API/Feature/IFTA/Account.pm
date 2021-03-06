package TMS::API::Feature::IFTA::Account;
use Moose;

use TMS::API::Core::CrrIfta;
use TMS::API::Core::GenFile;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::CrrIfta'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( ['proof_doc'] );
}

1;
