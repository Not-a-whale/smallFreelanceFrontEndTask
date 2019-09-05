package TMS::API::Core::FinInvoicePaymentItem;

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
use TMS::API::Core::FinInvoicesItem;
use TMS::API::Core::FinInvoicePayment;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InvoicePaymentId => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'FinInvoicePaymentObj',);
has InvoiceItemId    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'FinInvoicesItemObj',);

# AUTO-GENERATED HAS-A END

1;

