package TMS::Test::Core::InvRole;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Notes'    => ' ',
    'RoleName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvRole';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
