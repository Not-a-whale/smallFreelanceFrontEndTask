package TMS::API::Core::HrPayrate;

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

has 'PayRateId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'RateType'  => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'hourly');

# relations
has 'ast'       => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'agreement' => ('is' => 'rw', 'isa' => 'ObjGenFile',     'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrPayrate');

1;
