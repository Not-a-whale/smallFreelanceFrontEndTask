package TMS::API::Core::InvUnitsToEquipment;

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
use TMS::API::Core::InvEquipment;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has UnitId      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'InvUnitObj',);
has EquipmentId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'InvEquipmentObj',);
has DateAdded   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AddedBy     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'HrAssociateObj',);
has DateRemoved => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has RemovedBy   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'HrAssociateObj',);
has Notes       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

