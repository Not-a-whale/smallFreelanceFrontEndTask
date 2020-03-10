package TMS::API::Core::FinJob;

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

has 'JobCreated' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'JobId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'Title'      => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');

# relations point to us
has 'dsp_loads'           => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',         'coerce' => '1', 'required' => '0');
has 'fin_invoices_items'  => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem', 'coerce' => '1', 'required' => '0');
has 'fin_journal_entries' => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry', 'coerce' => '1', 'required' => '0');
has 'fin_transactions'    => ('is' => 'rw', 'isa' => 'ArrayObjFinTransaction',  'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinJob');

1;
