package TMS::API::Core::FinJournalEntry;

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

has 'Classification' => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'customer');
has 'CreatedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'DebitCredit'    => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'debit');
has 'JobId'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'JrlEntryId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'ReportAmount'   => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');
has 'VendorAmount'   => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');

# relations
has 'account' => ('is' => 'rw', 'isa' => 'ObjFinAccount', 'required' => '0');
has 'fin_invoices_items_credit_journal_entries' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem', 'required' => '0');
has 'transaction' => ('is' => 'rw', 'isa' => 'ObjFinTransaction', 'required' => '0');
has 'entity'      => ('is' => 'rw', 'isa' => 'ObjEntity',         'required' => '0');
has 'fin_invoices_items_debit_journal_entries' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem', 'required' => '0');
has 'job'        => ('is' => 'rw', 'isa' => 'ObjFinJob',      'required' => '0');
has 'created_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinJournalEntry');

1;
