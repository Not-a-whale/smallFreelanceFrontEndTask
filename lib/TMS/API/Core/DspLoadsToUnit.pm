package TMS::API::Core::DspLoadsToUnit;

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
use TMS::API::Core::EntPerson;
use TMS::API::Core::InvUnit;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DspLoadObj',);
has UnitId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvUnitObj',);
has DateAdded => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has AddedBy   => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);

# AUTO-GENERATED HAS-A END

1;

