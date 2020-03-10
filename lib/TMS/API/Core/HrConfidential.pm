package TMS::API::Core::HrConfidential;

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

has 'AstId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'PersonalEmail' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'PersonalPhone' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'ast'            => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'personal_phone' => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrConfidential');

1;
