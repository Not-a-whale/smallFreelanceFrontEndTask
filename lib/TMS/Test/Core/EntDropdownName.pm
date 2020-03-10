package TMS::Test::Core::EntDropdownName;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'WhatAmI' => ' ',
    'Name'    => ' ',
    'Id'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntDropdownName';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
