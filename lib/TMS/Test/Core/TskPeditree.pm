package TMS::Test::Core::TskPeditree;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Child'  => ' ',
    'Parent' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TskPeditree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
