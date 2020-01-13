package TMS::Test::Core::InvEquipmentType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'Name' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvEquipmentType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
