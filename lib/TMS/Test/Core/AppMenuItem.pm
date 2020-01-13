package TMS::Test::Core::AppMenuItem;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Title'     => ' ',
    'Label'     => ' ',
    'Help'      => ' ',
    'Target'    => ' ',
    'SortIndex' => ' ',
    'Route'     => ' ',
    'Enabled'   => ' ',
    'Icon'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
