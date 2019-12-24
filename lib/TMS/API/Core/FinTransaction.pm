package TMS::API::Core::FinTransaction;

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

has 'Class'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'CreatedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateCreated'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateTransaction' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'JobId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Memo'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'RefNumber'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Status'          => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'TransactionId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');

# relations
has 'fin_journal_entries'  => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',   'required' => '0');
has 'fin_cheques'          => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',         'required' => '0');
has 'transaction_type'     => ('is' => 'rw', 'isa' => 'ObjFinTransactionType',     'required' => '0');
has 'class'                => ('is' => 'rw', 'isa' => 'ObjFinClass',               'required' => '0');
has 'fin_invoice_payments' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment', 'required' => '0');
has 'job'                  => ('is' => 'rw', 'isa' => 'ObjFinJob',                 'required' => '0');
has 'created_by'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate',            'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinTransaction');

1;
