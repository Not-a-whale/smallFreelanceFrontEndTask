package TMS::Test::Core::BizCompanyTree;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Depth'        => ' ',
    'DescendantId' => ' ',
    'AncestorId'   => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizCompanyTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
