package TMS::API::Core::JobsCharge;

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
use TMS::API::Core::HrAssociate;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has ChargeId        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has JobId           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has DateAdded       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has AddedBy         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj',);
has ChargeItemId    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Int',);
has ChargedEntityId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'SetOne',);

# AUTO-GENERATED HAS-A END

1;
