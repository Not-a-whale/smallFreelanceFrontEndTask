package TMS::Test::Core::CmmPackage;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {};

with 'MooseX::Traits';
extends 'TMS::API::Core::CmmPackage';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
