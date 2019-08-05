package TMS::API::Core::AppRole;

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
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has RoleId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has RoleName    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Description => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has UserDefined => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has Editable    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Bool',);
has CreatedBy   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has UpdatedBy   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntPersonObj',);
has DateCreated => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateUpdated => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

