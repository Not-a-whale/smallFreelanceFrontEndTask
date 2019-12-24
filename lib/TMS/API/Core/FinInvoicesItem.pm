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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Amount'               => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'Comments'             => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CreatedBy'            => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'CreditJournalEntryId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateCreated'          => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DebitJournalEntryId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'InvoiceId'            => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'InvoiceItemId'        => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'ItemTemplateId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Notes'                => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Quantity'             => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1', 'default' => '1');

# relations
has 'credit_journal_entry'      => ('is' => 'rw', 'isa' => 'ObjFinJournalEntry',            'required' => '0');
has 'debit_journal_entry'       => ('is' => 'rw', 'isa' => 'ObjFinJournalEntry',            'required' => '0');
has 'fin_invoice_payment_items' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePaymentItem', 'required' => '0');
has 'item_template'             => ('is' => 'rw', 'isa' => 'ObjFinItemTemplate',            'required' => '0');
has 'job'                       => ('is' => 'rw', 'isa' => 'ObjFinJob',                     'required' => '0');
has 'invoice'                   => ('is' => 'rw', 'isa' => 'ObjFinInvoice',                 'required' => '0');
has 'created_by'                => ('is' => 'rw', 'isa' => 'ObjHrAssociate',                'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinInvoicesItem');

1;
