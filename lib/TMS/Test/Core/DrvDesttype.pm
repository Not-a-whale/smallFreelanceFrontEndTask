package TMS::Test::Core::DrvDesttype;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'DestName' => ' ',
    'Notes'    => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DrvDesttype';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
