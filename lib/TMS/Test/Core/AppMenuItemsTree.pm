package TMS::Test::Core::AppMenuItemsTree;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::AppMenuItem;

my $attr = {
    'ancestor' => {
        'Help'      => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Enabled'   => ' ',
        'Icon'      => ' ',
        'Label'     => ' ',
        'Target'    => ' ',
        'Title'     => ' '
    },
    'descendant' => {
        'Help'      => ' ',
        'SortIndex' => ' ',
        'Route'     => ' ',
        'Enabled'   => ' ',
        'Icon'      => ' ',
        'Label'     => ' ',
        'Target'    => ' ',
        'Title'     => ' '
    },
    'Depth' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppMenuItemsTree';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
