package TMS::API::Core::AppRoleMenus;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

# AUTO-GENERATED DEPENDENCIES START
use TMS::API::Core::AppRole;
use TMS::API::Core::AppMenuItem;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has RoleMenuBranchId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has RoleId           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'AppRoleObj',);
has MenuItemId       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'AppMenuItemObj',);

# AUTO-GENERATED HAS-A END

1;

