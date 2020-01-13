package TMS::Test::Core::InvTrailerType;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvTrailerType';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
