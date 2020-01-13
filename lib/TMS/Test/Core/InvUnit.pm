package TMS::Test::Core::InvUnit;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'UnitTag' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvUnit';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
