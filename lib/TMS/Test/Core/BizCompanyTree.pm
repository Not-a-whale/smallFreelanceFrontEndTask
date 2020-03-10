package TMS::Test::Core::BizCompanyTree;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DescendantId' => ' ',
    'AncestorId'   => ' ',
    'Depth'        => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizCompanyTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
