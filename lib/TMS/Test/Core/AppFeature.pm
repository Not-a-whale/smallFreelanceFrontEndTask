package TMS::Test::Core::AppFeature;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Notes' => ' ',
    'Name'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppFeature';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
