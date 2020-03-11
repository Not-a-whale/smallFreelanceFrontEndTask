package TMS::API::Feature::FeaturesRoles;
use Moose;

use TMS::API::Core::AppFeature;
use TMS::API::Core::AppRole;
use TMS::API::Core::AppRolePermission;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::AppRolePermission'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch( [ 'app_feature', 'role' ] );
}

1;
