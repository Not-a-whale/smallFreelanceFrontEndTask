package TMS::API::Core::BrkLoadstatus;

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

has 'LoadId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'StatId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'StatListId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'UpdatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'UpdatedOn'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');

# relations depends on
has 'load'       => ('is' => 'rw', 'isa' => 'ObjDspLoad',       'coerce' => '1', 'required' => '0');
has 'stat_list'  => ('is' => 'rw', 'isa' => 'ObjBrkStatuslist', 'coerce' => '1', 'required' => '0');
has 'updated_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',   'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_brk_loadstatuses' => ('is' => 'rw', 'isa' => 'ArrayObjMsgBrkLoadstatus', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BrkLoadstatus');

1;
