package TMS::API::Core::CmmAssignmentsCustomer;

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

has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME', 'required' => '0');

# relations
has 'commission_package' => ('is' => 'rw', 'isa' => 'ObjCmmPackage',  'required' => '0');
has 'customer'           => ('is' => 'rw', 'isa' => 'ObjEntCustomer', 'required' => '0');
has 'added_by'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'associate'          => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CmmAssignmentsCustomer');

1;
