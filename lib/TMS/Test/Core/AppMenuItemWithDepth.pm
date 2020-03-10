package TMS::Test::Core::AppMenuItemWithDepth;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Help'       => ' ',
    'Depth'      => ' ',
    'ParentId'   => ' ',
    'SortIndex'  => ' ',
    'Route'      => ' ',
    'MenuItemId' => ' ',
    'Path'       => ' ',
    'Enabled'    => ' ',
    'Icon'       => ' ',
    'Label'      => ' ',
    'Title'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemWithDepth';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
