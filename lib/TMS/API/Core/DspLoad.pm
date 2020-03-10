package TMS::API::Core::DspLoad;

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

has 'BookedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'BrokerId'       => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'CreatedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'DateBooked'     => ('is' => 'rw', 'isa' => 'DATETIME',          'coerce' => '1', 'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',          'coerce' => '1', 'required' => '0');
has 'DispatchNote'   => ('is' => 'rw', 'isa' => 'TidySpacesString',  'coerce' => '1', 'required' => '0');
has 'GoogleRoute'    => ('is' => 'rw', 'isa' => 'TidySpacesString',  'coerce' => '1', 'required' => '0');
has 'Job'            => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'LoadId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',     'coerce' => '1', 'required' => '0');
has 'LoadNumber'     => ('is' => 'rw', 'isa' => 'VarChar64',         'coerce' => '1', 'required' => '0');
has 'LoadType'       => ('is' => 'rw', 'isa' => 'enum_LoadType',     'coerce' => '1', 'required' => '0');
has 'Precooling'     => ('is' => 'rw', 'isa' => 'CurrencyValue',     'coerce' => '1', 'required' => '0');
has 'ProNumber'      => ('is' => 'rw', 'isa' => 'VarChar16',         'coerce' => '1', 'required' => '0');
has 'ReeferTempHigh' => ('is' => 'rw', 'isa' => 'CurrencyValue',     'coerce' => '1', 'required' => '0');
has 'ReeferTempLow'  => ('is' => 'rw', 'isa' => 'CurrencyValue',     'coerce' => '1', 'required' => '0');
has 'ShipperId'      => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'VarChar45',         'coerce' => '1', 'required' => '0');
has 'TeamRequired'   => ('is' => 'rw', 'isa' => 'enum_TeamRequired', 'coerce' => '1', 'required' => '0');
has 'TempMode'       => ('is' => 'rw', 'isa' => 'enum_TempMode',     'coerce' => '1', 'required' => '0');
has 'TruckType'      => ('is' => 'rw', 'isa' => 'VarChar24',         'coerce' => '1', 'required' => '0');

# relations depends on
has 'booked_by'  => ('is' => 'rw', 'isa' => 'ObjHrAssociate',    'coerce' => '1', 'required' => '0');
has 'broker'     => ('is' => 'rw', 'isa' => 'ObjEntCustomer',    'coerce' => '1', 'required' => '0');
has 'created_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate',    'coerce' => '1', 'required' => '0');
has 'job'        => ('is' => 'rw', 'isa' => 'ObjFinJob',         'coerce' => '1', 'required' => '0');
has 'shipper'    => ('is' => 'rw', 'isa' => 'ObjEntShipper',     'coerce' => '1', 'required' => '0');
has 'truck_type' => ('is' => 'rw', 'isa' => 'ObjInvTrailerType', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_dispatched'   => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',   'coerce' => '1', 'required' => '0');
has 'dsp_loads_docs'         => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',         'coerce' => '1', 'required' => '0');
has 'dsp_loads_required_equipments' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsRequiredEquipment', 'coerce' => '1', 'required' => '0');
has 'dsp_trips_loads' => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoad');

1;
