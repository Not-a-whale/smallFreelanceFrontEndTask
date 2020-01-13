package TMS::Test::Core::InvRole;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'RoleName' => ' ',
    'Notes'    => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvRole';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
