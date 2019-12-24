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

has 'CardId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'Photo'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

# relations
has 'photo'           => ('is' => 'rw', 'isa' => 'ObjGenFile',           'required' => '0');
has 'ast'             => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'required' => '0');
has 'added_by'        => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'required' => '0');
has 'hr_hire_records' => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrGovidcard');

1;
