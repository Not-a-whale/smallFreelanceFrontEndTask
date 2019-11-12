package TMS::API::Core::InvTrailer;

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
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::InvVehicle;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
<<<<<<< HEAD
has TrailerId     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvVehicleObj | Int ',);
=======
has TrailerId     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvVehicleObj | Int ',);
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0
has Type          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvTrailerTypeObj | Int ',);
has HazMat        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has LoadLength    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadWidth     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadHeight    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DoorWidth     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has DoorHeight    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has LoadCapactiy  => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has HasLiftGate   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has HasPalletJack => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has HasRamps      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);
has LoadVolume    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);

# AUTO-GENERATED HAS-A END

1;

