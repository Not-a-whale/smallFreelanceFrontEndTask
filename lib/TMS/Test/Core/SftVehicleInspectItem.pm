package TMS::Test::Core::SftVehicleInspectItem;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Notes'        => ' ',
    'ItemAreaName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftVehicleInspectItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
