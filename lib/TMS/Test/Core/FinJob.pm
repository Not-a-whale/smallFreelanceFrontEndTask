package TMS::Test::Core::FinJob;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'JobCreated' => ' ',
    'JobAddedBy' => ' ',
    'Title'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinJob';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
