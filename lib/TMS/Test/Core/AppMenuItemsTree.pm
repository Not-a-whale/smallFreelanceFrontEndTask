package TMS::Test::Core::AppMenuItemsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::AppMenuItem;

my $attr = {
    'ancestor' => {
        'Target'    => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Title'     => ' ',
        'Enabled'   => ' ',
        'Help'      => ' ',
        'Icon'      => ' ',
        'Label'     => ' '
    },
    'descendant' => {
        'Target'    => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Title'     => ' ',
        'Enabled'   => ' ',
        'Label'     => ' ',
        'Icon'      => ' ',
        'Help'      => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
