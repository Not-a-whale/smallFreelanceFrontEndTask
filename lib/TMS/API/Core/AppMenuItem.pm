package TMS::API::Core::AppMenuItem;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Enabled'    => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '0', 'default' => '1');
has 'Help'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Icon'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'ParentId'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Route'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1', 'default' => 'tms.app.error');
has 'SortIndex' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0', 'default' => '0.000');
has 'Target'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Title'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'app_menu_items_trees_ancestors' => ('is' => 'rw', 'isa' => 'ArrayObjAppMenuItemsTree', 'required' => '0');
has 'app_menu_items_trees_descendants' =>
    ('is' => 'rw', 'isa' => 'ArrayObjAppMenuItemsTree', 'required' => '0');
has 'app_menu_items'   => ('is' => 'rw', 'isa' => 'ArrayObjAppMenuItem',  'required' => '0');
has 'app_role_menuses' => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleMenus', 'required' => '0');
has 'parent'           => ('is' => 'rw', 'isa' => 'ObjAppMenuItem',       'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppMenuItem');

1;
