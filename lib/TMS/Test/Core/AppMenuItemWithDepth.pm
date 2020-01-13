package TMS::Test::Core::AppMenuItemWithDepth;

use Moose;
use TMS::Test::BuildAttributes;

my $attr = {
    'Title'      => ' ',
    'ParentId'   => ' ',
    'Label'      => ' ',
    'Route'      => ' ',
    'Enabled'    => ' ',
    'Icon'       => ' ',
    'MenuItemId' => ' ',
    'Depth'      => ' ',
    'Help'       => ' ',
    'Path'       => ' ',
    'SortIndex'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemWithDepth';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
