package TMS::API::Core::InvEquipment;

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

has 'DatePurchased'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateSold'       => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'EquipmentId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'EquipmentType'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'PricePurchased' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'PriceSold'      => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'SerialNo'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'VendorId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

# relations
has 'inv_vehicle'               => ('is' => 'rw', 'isa' => 'ObjInvVehicle',                 'required' => '0');
has 'vendor'                    => ('is' => 'rw', 'isa' => 'ObjBizBranch',                  'required' => '0');
has 'inv_units_to_equipments'   => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment',   'required' => '0');
has 'inv_equipment_docs'        => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentDoc',       'required' => '0');
has 'inv_notes'                 => ('is' => 'rw', 'isa' => 'ArrayObjInvNote',               'required' => '0');
has 'owner'                     => ('is' => 'rw', 'isa' => 'ObjHrAssociate',                'required' => '0');
has 'sft_elog_stats'            => ('is' => 'rw', 'isa' => 'ArrayObjSftElogStat',           'required' => '0');
has 'equipment_type'            => ('is' => 'rw', 'isa' => 'ObjInvEquipmentType',           'required' => '0');
has 'inv_elog_device'           => ('is' => 'rw', 'isa' => 'ObjInvElogDevice',              'required' => '0');
has 'inv_equipments_to_support' => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipmentToSupport', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvEquipment');

1;
