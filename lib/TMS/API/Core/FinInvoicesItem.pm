package TMS::API::Core::FinInvoicesItem;

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

has 'Amount'               => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'Comments'             => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'CreatedBy'            => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'CreditJournalEntryId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateCreated'          => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DebitJournalEntryId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InvoiceId'            => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InvoiceItemId'        => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'ItemTemplateId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'JobId'                => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'                => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations depends on
has 'created_by'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate',     'coerce' => '1', 'required' => '0');
has 'credit_journal_entry' => ('is' => 'rw', 'isa' => 'ObjFinJournalEntry', 'coerce' => '1', 'required' => '0');
has 'debit_journal_entry'  => ('is' => 'rw', 'isa' => 'ObjFinJournalEntry', 'coerce' => '1', 'required' => '0');
has 'invoice'              => ('is' => 'rw', 'isa' => 'ObjFinInvoice',      'coerce' => '1', 'required' => '0');
has 'item_template'        => ('is' => 'rw', 'isa' => 'ObjFinItemTemplate', 'coerce' => '1', 'required' => '0');
has 'job'                  => ('is' => 'rw', 'isa' => 'ObjFinJob',          'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_invoice_payment_items' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePaymentItem', 'coerce' => '1', 'required' => '0');
has 'msg_fin_invoices_items'    => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinInvoicesItem',    'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinInvoicesItem');

1;
