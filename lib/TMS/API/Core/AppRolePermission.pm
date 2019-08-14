package TMS::API::Core::AppRolePermission;

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
use TMS::API::Core::AppPermission;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has Role       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'AppRoleObj',);
has Permission => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'AppPermissionObj',);

# AUTO-GENERATED HAS-A END

1;

