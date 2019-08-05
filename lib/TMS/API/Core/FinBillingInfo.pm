package TMS::API::Core::FinBillingInfo;

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
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::Entity;
use TMS::API::Core::FinBillingTag;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BillingId       => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has EntityId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj',);
has PayToTheOrderOf => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has ContactName     => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Phone           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj',);
has Fax             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntPhonesfaxObj',);
has Address         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj',);
has EMail           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has BillingTagId    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinBillingTagObj',);
has DateIn          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateOut         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes           => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;
