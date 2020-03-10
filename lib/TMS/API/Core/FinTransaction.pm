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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Class'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'CreatedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateCreated'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateTransaction' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'JobId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Memo'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'RefNumber'       => ('is' => 'rw', 'isa' => 'VarChar20',        'coerce' => '1', 'required' => '0');
has 'Status'          => ('is' => 'rw', 'isa' => 'enum_Status',      'coerce' => '1', 'required' => '0');
has 'TransactionId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'class'            => ('is' => 'rw', 'isa' => 'ObjFinClass',           'coerce' => '1', 'required' => '0');
has 'created_by'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate',        'coerce' => '1', 'required' => '0');
has 'job'              => ('is' => 'rw', 'isa' => 'ObjFinJob',             'coerce' => '1', 'required' => '0');
has 'transaction_type' => ('is' => 'rw', 'isa' => 'ObjFinTransactionType', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_cheques'          => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',         'coerce' => '1', 'required' => '0');
has 'fin_invoice_payments' => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment', 'coerce' => '1', 'required' => '0');
has 'fin_journal_entries'  => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',   'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinTransaction');

1;
