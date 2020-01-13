package TMS::Test::Core::FinAccountTypesRoot;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DescendantId' => ' ',
    'RootId'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountTypesRoot';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
