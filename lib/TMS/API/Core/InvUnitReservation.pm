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
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvRole;
use TMS::API::Core::InvUnit;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ReservationId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has PrsnId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has UnitId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvUnitObj',);
has InvRoleId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvRoleObj',);
has DateReserved  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATE',);
has DateReleased  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATE',);
has CreatedBy     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj',);
has CreatedOn     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;
