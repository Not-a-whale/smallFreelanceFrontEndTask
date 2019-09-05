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
use TMS::API::Core::Entity;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::FinPaymentMethod;
use TMS::API::Core::FinInvoice;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoicePaymentId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'PrimaryKeyInt',);
has InvoiceId        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'FinInvoiceObj',);
has TransactionId    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'FinTransactionObj',);
has PaymentMethodId  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'FinPaymentMethodObj',);
has PayerId          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EntityObj',);
has CreatedBy        => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'HrAssociateObj',);
has Amount           => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'Float',);
has DateCreated      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has DatePayment      => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Valid            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'BoolInt',);

# AUTO-GENERATED HAS-A END

1;

