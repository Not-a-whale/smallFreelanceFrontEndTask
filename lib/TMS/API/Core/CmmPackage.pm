package TMS::API::Core::CmmPackage;

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

# relations
has 'cmm_assignments_customers' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'required' => '0');
has 'cmm_assignments'           => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignment',          'required' => '0');
has 'cmm_assignments_groups'    => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsGroup',    'required' => '0');
has 'cmm_package_tiers'         => ('is' => 'rw', 'isa' => 'ArrayObjCmmPackageTier',         'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CmmPackage');

1;
