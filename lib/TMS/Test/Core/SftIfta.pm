package TMS::Test::Core::SftIfta;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftIfta';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
