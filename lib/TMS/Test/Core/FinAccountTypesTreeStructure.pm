package TMS::Test::Core::FinAccountTypesTreeStructure;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Structure' => ' ',
    'AccountId' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesTreeStructure';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
