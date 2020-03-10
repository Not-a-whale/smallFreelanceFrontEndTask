package TMS::Test::Core::AppMenuItem;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Help'      => ' ',
    'SortIndex' => ' ',
    'Route'     => ' ',
    'Enabled'   => ' ',
    'Icon'      => ' ',
    'Label'     => ' ',
    'Target'    => ' ',
    'Title'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
