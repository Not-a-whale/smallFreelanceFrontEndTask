package TMS::API::Core::SftVehicleRegistration;

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
has RegistrationId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has VehicleId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvVehicleObj | Int ',);
has PlateNumber      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has State            => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has DateRegistration => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has DateExpiration   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has ProRate          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

