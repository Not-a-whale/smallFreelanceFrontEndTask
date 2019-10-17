package TMS::API::Core::InvUnitReservation;

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
use TMS::API::Core::InvUnit;
use TMS::API::Core::InvRole;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ReservationId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has PrsnId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has UnitId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvUnitObj | Int ',);
has InvRoleId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvRoleObj | Int ',);
has DateReserved  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DateReleased  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has CreatedBy     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has CreatedOn     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

