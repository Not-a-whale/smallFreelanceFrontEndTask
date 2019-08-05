package TMS::API::Core::DspLoad;

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
use TMS::API::Core::EntCustomer;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::Job;
use TMS::API::Core::EntShipper;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntPerson;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadId         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has CreatedBy      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);
has BrokerId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCustomerObj',);
has ShipperId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntShipperObj',);
has BookedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateBooked     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has LoadNumber     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has ProNumber      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has LoadType       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumFtl',);
has TruckType      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvTrailerTypeObj',);
has ReeferTempLow  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has ReeferTempHigh => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Precooling     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has TempMode       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumContinuous',);
has TeamRequired   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'ENUM',);
has DispatchNote   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Job            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'JobObj',);

# AUTO-GENERATED HAS-A END

1;

