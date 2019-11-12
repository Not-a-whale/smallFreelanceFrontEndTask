package TMS::API::Core::FinInvoicePayment;

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
use TMS::API::Core::FinInvoice;
use TMS::API::Core::FinPaymentMethod;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::Entity;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoicePaymentId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has InvoiceId        => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinInvoiceObj | Int ',);
has TransactionId    => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinTransactionObj | Int ',);
has PaymentMethodId  => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'FinPaymentMethodObj | Int ',);
has PayerId          => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntityObj | Int ',);
has CreatedBy        => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'HrAssociateObj | Int ',);
has Amount           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has DateCreated      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DatePayment      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Valid            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

