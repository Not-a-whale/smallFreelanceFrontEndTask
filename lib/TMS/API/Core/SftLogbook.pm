package TMS::API::Core::SftLogbook;

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

has 'LogbookId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Notes'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'trip'            => ('is' => 'rw', 'isa' => 'ObjDspTrip',          'required' => '0');
has 'sft_log_entries' => ('is' => 'rw', 'isa' => 'ArrayObjSftLogEntry', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftLogbook');

1;
