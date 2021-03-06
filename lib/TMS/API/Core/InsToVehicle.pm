package TMS::API::Core::InsToVehicle;

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

has 'ActionEmail'    => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'ActionNote'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ActionReminder' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'AddedBy'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'DateRemoved'    => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'InsId'          => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'RemovedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'VehicleId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'VhlInsId'       => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');

# relations depends on
has 'added_by'   => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'in'         => ('is' => 'rw', 'isa' => 'ObjInsPolicy',   'coerce' => '1', 'required' => '0');
has 'removed_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'vehicle'    => ('is' => 'rw', 'isa' => 'ObjInvVehicle',  'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_ins_to_vehicles' => ('is' => 'rw', 'isa' => 'ArrayObjMsgInsToVehicle', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InsToVehicle');

1;
