package TMS::API::Core::DspTripsLoad;

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
<<<<<<< HEAD
use TMS::API::Core::DspTrip;
use TMS::API::Core::DspLoad;
use TMS::API::Core::HrAssociate;
=======
use TMS::API::Core::HrAssociate;
use TMS::API::Core::DspLoad;
use TMS::API::Core::DspTrip;
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has TripLoadId     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has TripId         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DspTripObj | Int ',);
has LoadId         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DspLoadObj | Int ',);
has DateDispatched => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has LoadDispatcher => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);

# AUTO-GENERATED HAS-A END

1;

