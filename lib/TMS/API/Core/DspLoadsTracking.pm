package TMS::API::Core::DspLoadsTracking;

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
use TMS::API::Core::DspLoadsDestination;
use TMS::API::Core::DrvDriver;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestinationId => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DspLoadsDestinationObj | Int ',);
has DriverId      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DrvDriverObj | Int ',);
has DateArrived   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateDeparted  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Pallets       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Weight        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Pieces        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has BolPod        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumNo',);
has BolPodNumber  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has SealNumber    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Notes         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

