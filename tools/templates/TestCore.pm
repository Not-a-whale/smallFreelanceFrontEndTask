package TMS::Test::Core::DBIXCLASS;

use Moose;
use TMS::Test::BuildAttributes;
DEPENDENCYCLASSES

my $attr = ATTRIBUTES;

with 'MooseX::Traits';
extends 'TMS::API::Core::DBIXCLASS';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
