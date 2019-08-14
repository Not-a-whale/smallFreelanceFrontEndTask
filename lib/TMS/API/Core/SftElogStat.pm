package TMS::API::Core::SftElogStat;

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
use TMS::API::Core::InvEquipment;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has GpsReqId           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has EquipmentId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvEquipmentObj',);
has Longitude          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Latitude           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has Bearings           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Speed              => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Fuel               => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Odometer           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has LocationProviderId => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has EngineHours        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has VehicleState       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Acquired           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Posted             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

