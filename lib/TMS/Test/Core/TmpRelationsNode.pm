package TMS::Test::Core::TmpRelationsNode;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'Name' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::TmpRelationsNode';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
