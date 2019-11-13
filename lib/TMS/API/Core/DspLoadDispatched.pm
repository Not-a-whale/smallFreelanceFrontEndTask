package TMS::API::Core::DspLoadDispatched;

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
use TMS::API::Core::DspLoad;
use TMS::API::Core::InvUnit;
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadVsUnitId   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has LoadId         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DspLoadObj | Int ',);
has UnitId         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvUnitObj | Int ',);
has DateDispatched => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DispatchedBy   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);

# AUTO-GENERATED HAS-A END

1;

