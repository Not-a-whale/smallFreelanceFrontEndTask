package TMS::Test::Core::TskPedigree;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'descendant' => ' ',
    'Child'      => ' ',
    'ancestor'   => ' ',
    'length'     => ' ',
    'Parent'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TskPedigree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
