package TMS::Test::Core::FinAccountsTreeStructure;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Structure' => ' ',
    'AccountId' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinAccountsTreeStructure';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
