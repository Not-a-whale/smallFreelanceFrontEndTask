package TMS::API::Core::FinInvoicePayment;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'CreatedBy'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'DateCreated'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'DatePayment'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'InvoiceId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'InvoicePaymentId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'PayerId'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'PaymentMethodId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'TransactionId'    => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'created_by'     => ('is' => 'rw', 'isa' => 'ObjHrAssociate',      'coerce' => '1', 'required' => '0');
has 'invoice'        => ('is' => 'rw', 'isa' => 'ObjFinInvoice',       'coerce' => '1', 'required' => '0');
has 'payer'          => ('is' => 'rw', 'isa' => 'ObjEntity',           'coerce' => '1', 'required' => '0');
has 'payment_method' => ('is' => 'rw', 'isa' => 'ObjFinPaymentMethod', 'coerce' => '1', 'required' => '0');
has 'transaction'    => ('is' => 'rw', 'isa' => 'ObjFinTransaction',   'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_invoice_payment_items' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePaymentItem', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinInvoicePayment');

1;
