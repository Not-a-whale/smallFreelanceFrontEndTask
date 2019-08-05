package TMS::API::Core::InvSprinter;

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
use TMS::API::Core::InvVehicle;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has SprinterId              => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvVehicleObj',);
has FuelTankCapacity        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has MilesPerGallonEstimated => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has MilesPerGallonRated     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadLength              => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadWidth               => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has RoofHeight              => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DoorHeight              => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DoorWidth               => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has TowCapacity             => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadCapacity            => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadVolume              => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);

# AUTO-GENERATED HAS-A END

1;

