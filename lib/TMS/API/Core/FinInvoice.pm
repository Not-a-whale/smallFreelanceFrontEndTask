package TMS::API::Core::FinInvoice;

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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Comments'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateInvoiced'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'FactoredParent' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'PONumber'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'RefNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'entity'               => ('is' => 'rw', 'isa' => 'ObjEntity',                 'coerce' => '1', 'required' => '0');
has 'factored_parent'      => ('is' => 'rw', 'isa' => 'ObjFinInvoice',             'coerce' => '1', 'required' => '0');
has 'fin_invoice_payments' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment', 'coerce' => '1', 'required' => '0');
has 'fin_invoices'         => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoice',        'coerce' => '1', 'required' => '0');
has 'fin_invoices_items'   => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem',   'coerce' => '1', 'required' => '0');
has 'payment_term'         => ('is' => 'rw', 'isa' => 'ObjFinPaymentTerm',         'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinInvoice');

1;
