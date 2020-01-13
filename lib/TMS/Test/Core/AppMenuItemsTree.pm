package TMS::Test::Core::AppMenuItemsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::AppMenuItem;

my $attr = {
    'ancestor' => {
        'Title'     => ' ',
        'Label'     => ' ',
        'Help'      => ' ',
        'Target'    => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Enabled'   => ' ',
        'Icon'      => ' '
    },
    'descendant' => {
        'Title'     => ' ',
        'Label'     => ' ',
        'Help'      => ' ',
        'Target'    => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Icon'      => ' ',
        'Enabled'   => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
