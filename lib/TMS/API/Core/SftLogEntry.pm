package TMS::API::Core::SftLogEntry;

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

has 'DriverId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Location'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'LogbookEntryId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'LogbookId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'StartTime'      => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'driver'   => ('is' => 'rw', 'isa' => 'ObjDrvDriver',   'coerce' => '1', 'required' => '0');
has 'location' => ('is' => 'rw', 'isa' => 'ObjSftElogStat', 'coerce' => '1', 'required' => '0');
has 'logbook'  => ('is' => 'rw', 'isa' => 'ObjSftLogbook',  'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftLogEntry');

1;
