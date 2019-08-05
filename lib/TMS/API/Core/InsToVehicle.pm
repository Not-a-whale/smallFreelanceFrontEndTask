package TMS::API::Core::InsToVehicle;

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
use TMS::API::Core::InsPolicy;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InsId       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InsPolicyObj',);
has VehicleId   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvVehicleObj',);
has DateAdded   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has DateRemoved => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has AddedBy     => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);

# AUTO-GENERATED HAS-A END

1;

