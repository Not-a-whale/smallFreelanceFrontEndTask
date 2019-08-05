package TMS::API::Core::AppMenuAction;

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
use TMS::API::Core::AppMenuItem;
use TMS::API::Core::AppMenuAction;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has MenuActionId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has ParentAction => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'AppMenuActionObj',);
has MenuItemId   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'AppMenuItemObj',);
has TargetNode   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has TargetType   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumNode',);
has Route        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Comments     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

