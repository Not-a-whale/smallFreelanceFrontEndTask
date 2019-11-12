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
use TMS::API::Core::FinBillingTag;
use TMS::API::Core::CntPhonesfax;
<<<<<<< HEAD
use TMS::API::Core::CntAddress;
use TMS::API::Core::Entity;
=======
use TMS::API::Core::Entity;
use TMS::API::Core::FinBillingTag;
use TMS::API::Core::CntAddress;
>>>>>>> d8b237c0a271ea8cabf70fd6a1180c53f82a77e0

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has BillingId       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has EntityId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj | Int ',);
has PayToTheOrderOf => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'TidySpacesString',);
has ContactName     => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has Phone           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntPhonesfaxObj | Int ',);
has Fax             => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'CntPhonesfaxObj | Int ',);
has Address         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj | Int ',);
has EMail           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);
has BillingTagId    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinBillingTagObj | Int ',);
has DateIn          => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DateOut         => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Notes           => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'TidySpacesString',);

# AUTO-GENERATED HAS-A END

1;

