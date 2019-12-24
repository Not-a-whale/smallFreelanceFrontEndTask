package TMS::API::Core::DspLoadsDoc;

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

has 'DateAdded'   => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'DocsLoadId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt',       'required' => '1', 'default' => '0');

# relations
has 'load'     => ('is' => 'rw', 'isa' => 'ObjDspLoad',     'required' => '0');
has 'added_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'file'     => ('is' => 'rw', 'isa' => 'ObjGenFile',     'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsDoc');

1;
