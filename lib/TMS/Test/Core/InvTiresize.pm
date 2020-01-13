package TMS::Test::Core::InvTiresize;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Type' => ' ',
    'Name' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvTiresize';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
