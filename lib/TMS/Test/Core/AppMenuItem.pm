package TMS::Test::Core::AppMenuItem;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Target'    => ' ',
    'SortIndex' => ' ',
    'Route'     => ' ',
    'Title'     => ' ',
    'Enabled'   => ' ',
    'Help'      => ' ',
    'Icon'      => ' ',
    'Label'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
