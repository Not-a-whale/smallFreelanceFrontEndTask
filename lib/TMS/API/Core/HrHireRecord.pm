package TMS::API::Core::HrHireRecord;

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

has 'AstId'                   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'EmploymentAuthorization' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'HireId'                  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'Photo'                   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'StatusChangedDate'       => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'StatusChangedNote'       => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');
has 'Title'                   => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');

# relations depends on
has 'ast'                      => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'employment_authorization' => ('is' => 'rw', 'isa' => 'ObjHrGovidcard', 'coerce' => '1', 'required' => '0');
has 'photo'                    => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrHireRecord');

1;
