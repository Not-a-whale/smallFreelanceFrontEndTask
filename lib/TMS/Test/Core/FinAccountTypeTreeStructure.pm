package TMS::Test::Core::FinAccountTypeTreeStructure;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'RootTypeId'    => ' ',
    'Structure'     => ' ',
    'AccountTypeId' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypeTreeStructure';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
