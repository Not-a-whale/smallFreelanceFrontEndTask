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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'HireId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'Photo'             => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'Status'            => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'active');
has 'StatusChangedDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'StatusChangedNote' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Title'             => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'photo'                    => ('is' => 'rw', 'isa' => 'ObjGenFile',     'required' => '0');
has 'ast'                      => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'employment_authorization' => ('is' => 'rw', 'isa' => 'ObjHrGovidcard', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrHireRecord');

1;
