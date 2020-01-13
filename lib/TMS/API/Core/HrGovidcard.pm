package TMS::API::Core::HrGovidcard;

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

has 'AddedBy' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'AstId'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CardId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'Photo'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations
has 'added_by'        => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'coerce' => '1', 'required' => '0');
has 'ast'             => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'coerce' => '1', 'required' => '0');
has 'hr_hire_records' => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord', 'coerce' => '1', 'required' => '0');
has 'photo'           => ('is' => 'rw', 'isa' => 'ObjGenFile',           'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrGovidcard');

1;
