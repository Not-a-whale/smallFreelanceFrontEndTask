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

has 'BookedBy'          => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'CreatedBy'         => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'CustomerAgentId'   => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'CustomerId'        => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'CustomerRefNumber' => ('is' => 'rw', 'isa' => 'VarChar64',            'coerce' => '1', 'required' => '0');
has 'DateBooked'        => ('is' => 'rw', 'isa' => 'DATETIME',             'coerce' => '1', 'required' => '0');
has 'DateCreated'       => ('is' => 'rw', 'isa' => 'DATETIME',             'coerce' => '1', 'required' => '0');
has 'Distance'          => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'GoogleRoute'       => ('is' => 'rw', 'isa' => 'TidySpacesString',     'coerce' => '1', 'required' => '0');
has 'Job'               => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'LoadId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',        'coerce' => '1', 'required' => '0');
has 'LoadNumber'        => ('is' => 'rw', 'isa' => 'VarChar64',            'coerce' => '1', 'required' => '0');
has 'LoadTerms'         => ('is' => 'rw', 'isa' => 'TidySpacesString',     'coerce' => '1', 'required' => '0');
has 'LoadType'          => ('is' => 'rw', 'isa' => 'enum_LoadType',        'coerce' => '1', 'required' => '0');
has 'Pallets'           => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'Pieces'            => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'Precooling'        => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'ProductTemp'       => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'ReeferTempHigh'    => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'ReeferTempLow'     => ('is' => 'rw', 'isa' => 'CurrencyValue',        'coerce' => '1', 'required' => '0');
has 'Status'            => ('is' => 'rw', 'isa' => 'VarChar45',            'coerce' => '1', 'required' => '0');
has 'TeamRequired'      => ('is' => 'rw', 'isa' => 'enum_TeamRequired',    'coerce' => '1', 'required' => '0');
has 'TemperatureMode'   => ('is' => 'rw', 'isa' => 'enum_TemperatureMode', 'coerce' => '1', 'required' => '0');
has 'VendorAgentId'     => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'VendorId'          => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');
has 'Weight'            => ('is' => 'rw', 'isa' => 'Float',                'coerce' => '1', 'required' => '0');

# relations depends on
has 'booked_by'      => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'created_by'     => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'customer'       => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'customer_agent' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'job'            => ('is' => 'rw', 'isa' => 'ObjFinJob',      'coerce' => '1', 'required' => '0');
has 'vendor'         => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'vendor_agent'   => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'brk_loadstatuses'       => ('is' => 'rw', 'isa' => 'ArrayObjBrkLoadstatus',       'coerce' => '1', 'required' => '0');
has 'dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_dispatched'   => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',   'coerce' => '1', 'required' => '0');
has 'dsp_loads_docs'         => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',         'coerce' => '1', 'required' => '0');
has 'dsp_loads_required_equipments' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsRequiredEquipment', 'coerce' => '1', 'required' => '0');
has 'dsp_trips_loads' => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoad');

1;
