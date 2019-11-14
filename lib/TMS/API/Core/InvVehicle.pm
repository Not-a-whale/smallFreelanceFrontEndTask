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
use TMS::API::Core::InvTiresize;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::EntCarrier;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has VehicleId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvEquipmentObj | Int ',);
has CarrierId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCarrierObj | Int ',);
has Make          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Model         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Color         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has VIN           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has TireSize      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvTiresizeObj | Int ',);
has Year          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'YEAR',);
has Axels         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Length        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Height        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Width         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has UnladenWeight => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Fuel          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumNone',);

# AUTO-GENERATED HAS-A END

1;

