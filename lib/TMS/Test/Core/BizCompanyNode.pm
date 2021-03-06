package TMS::Test::Core::BizCompanyNode;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Type'     => ' ',
    'ParentId' => ' ',
    'UnitName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizCompanyNode';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
