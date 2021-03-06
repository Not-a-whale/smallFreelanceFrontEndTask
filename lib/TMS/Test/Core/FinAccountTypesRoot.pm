package TMS::Test::Core::FinAccountTypesRoot;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'RootId'       => ' ',
    'DescendantId' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesRoot';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
