package TMS::Test::Core::TmpRelationsClsr;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::TmpRelationsNode;

my $attr = {
    'ancestor'   => {'Name' => ' '},
    'descendant' => {'Name' => ' '},
    'Depth'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TmpRelationsClsr';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
