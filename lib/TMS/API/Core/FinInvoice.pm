package TMS::API::Core::FinInvoice;

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
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::FinInvoice;
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::Types::Simple;
use TMS::Types::Objects;
use TMS::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoiceId      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'PrimaryKeyInt',);
has EntityId       => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj',);
has PaymentTermsId => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinPaymentTermObj',);
has DateCreated    => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has RefNumber      => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Notes          => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Comments       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has PONumber       => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Status         => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumInvalid',);
has DateInvoiced   => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has FactoredParent => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'FinInvoiceObj',);

# AUTO-GENERATED HAS-A END

1;
