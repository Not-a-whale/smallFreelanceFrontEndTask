package TMS::Test::Core::DrvDesttype;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Notes'    => ' ',
    'DestName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DrvDesttype';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
