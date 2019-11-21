package TMS::API::Core::SftVehicleInspectedItem;

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
use TMS::API::Core::SftVehicleInspection;
use TMS::API::Core::SftVehicleInspectItem;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InspectedId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has InspectionId  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftVehicleInspectionObj | Int ',);
has InspectedItem => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftVehicleInspectItemObj | Int ',);
has Status        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EnumNa',);
has InspectedDate => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

