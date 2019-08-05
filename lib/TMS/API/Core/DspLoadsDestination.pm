package TMS::API::Core::DspLoadsDestination;

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
use TMS::API::Core::BizBranch;
use TMS::API::Core::DspLoad;
use TMS::API::Core::CntAddress;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has DestinationId    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has AddressId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj',);
has LoadId           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DspLoadObj',);
has PU_PO            => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Commodity        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has Pallets          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Pieces           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has Weight           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has AppointmentStart => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'DATETIME',);
has AppointmentEnd   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has AppointmentType  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumAppointment',);
has StopOrder        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Int',);
has StopType         => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumPickup',);
has Branch           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'BizBranchObj',);
has AppointmentNotes => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;
