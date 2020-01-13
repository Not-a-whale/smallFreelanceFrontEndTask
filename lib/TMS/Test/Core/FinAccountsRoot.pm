package TMS::Test::Core::FinAccountsRoot;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DescendantId' => ' ',
    'RootId'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountsRoot';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
