package TMS::Test::Core::BizCompanyTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::BizCompanyNode;

my $attr = {
    'ancestor' => {
        'UnitName' => ' ',
        'Type'     => ' '
    },
    'descendant' => {
        'UnitName' => ' ',
        'Type'     => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizCompanyTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
