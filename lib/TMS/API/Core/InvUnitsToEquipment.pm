package TMS::API::Core::InvUnitsToEquipment;

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

has 'DateAdded'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateRemoved'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'EquipUnitResId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'RemovedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

# relations
has 'unit'       => ('is' => 'rw', 'isa' => 'ObjInvUnit',      'required' => '0');
has 'equipment'  => ('is' => 'rw', 'isa' => 'ObjInvEquipment', 'required' => '0');
has 'removed_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'required' => '0');
has 'added_by'   => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvUnitsToEquipment');

1;
