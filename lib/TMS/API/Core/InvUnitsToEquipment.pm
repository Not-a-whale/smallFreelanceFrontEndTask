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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'AddedBy'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateAdded'      => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateRemoved'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'EquipUnitResId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'EquipmentId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'RemovedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'UnitId'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'added_by'   => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'equipment'  => ('is' => 'rw', 'isa' => 'ObjInvEquipment', 'coerce' => '1', 'required' => '0');
has 'removed_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',  'coerce' => '1', 'required' => '0');
has 'unit'       => ('is' => 'rw', 'isa' => 'ObjInvUnit',      'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_inv_units_to_equipments' => ('is' => 'rw', 'isa' => 'ArrayObjMsgInvUnitsToEquipment', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvUnitsToEquipment');

1;
