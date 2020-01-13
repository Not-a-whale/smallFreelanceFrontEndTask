package TMS::Test::Core::AppMenuItemWithDepth;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Title'      => ' ',
    'MenuItemId' => ' ',
    'Path'       => ' ',
    'ParentId'   => ' ',
    'Depth'      => ' ',
    'Icon'       => ' ',
    'Label'      => ' ',
    'SortIndex'  => ' ',
    'Route'      => ' ',
    'Enabled'    => ' ',
    'Help'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemWithDepth';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
