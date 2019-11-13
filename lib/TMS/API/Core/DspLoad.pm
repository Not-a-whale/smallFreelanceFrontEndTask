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
use TMS::API::Core::FinJob;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntCustomer;
use TMS::API::Core::EntShipper;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has LoadId         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has CreatedBy      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'HrAssociateObj | Int ',);
has BrokerId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntCustomerObj | Int ',);
has ShipperId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EntShipperObj | Int ',);
has BookedBy       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateBooked     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has LoadNumber     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has ProNumber      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has LoadType       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumFtl',);
has TruckType      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'InvTrailerTypeObj | Int ',);
has ReeferTempLow  => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has ReeferTempHigh => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has Precooling     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'Float',);
has TempMode       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumContinuous',);
has TeamRequired   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'EnumYes',);
has DispatchNote   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Job            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinJobObj | Int ',);
has GoogleRoute    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

