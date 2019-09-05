package TMS::API::Core::DrvSchedule;

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
use TMS::API::Core::DrvDriver;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::DrvDesttype;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DrvSchdId       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has DriverId        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'DrvDriverObj',);
has ChangeDate      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has DesiredDestId   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'DrvDesttypeObj',);
has DesiredDestNote => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has PostedBy        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'HrAssociateObj',);
has PostedDate      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);

# AUTO-GENERATED HAS-A END

1;

