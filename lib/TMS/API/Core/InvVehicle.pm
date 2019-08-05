package TMS::API::Core::InvVehicle;

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
use TMS::API::Core::EntCarrier;
use TMS::API::Core::InvTiresize;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has VehicleId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvEquipmentObj',);
has CarrierId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCarrierObj',);
has Make          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Model         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Color         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has VIN           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has StateTag      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has TireSize      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvTiresizeObj',);
has Year          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'YEAR',);
has Axels         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Length        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Height        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Width         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has UnladenWeight => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Fuel          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumNone',);

# AUTO-GENERATED HAS-A END

1;
