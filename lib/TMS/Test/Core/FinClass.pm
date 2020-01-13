package TMS::Test::Core::FinClass;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {'Name' => ' '};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinClass';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
