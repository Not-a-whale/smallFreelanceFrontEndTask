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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'BookedBy'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateBooked'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DispatchNote'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'GoogleRoute'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Job'            => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'LoadId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'LoadNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'LoadType'       => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'Precooling'     => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'ProNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ReeferTempHigh' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'ReeferTempLow'  => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'ShipperId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'TeamRequired'   => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'TempMode'       => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'TruckType'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'shipper'                => ('is' => 'rw', 'isa' => 'ObjEntShipper',               'required' => '0');
has 'dsp_loads_docs'         => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',         'required' => '0');
has 'dsp_loads_dispatched'   => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',   'required' => '0');
has 'dsp_loads_destinations' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestination', 'required' => '0');
has 'broker'                 => ('is' => 'rw', 'isa' => 'ObjEntCustomer',              'required' => '0');
has 'truck_type'             => ('is' => 'rw', 'isa' => 'ObjInvTrailerType',           'required' => '0');
has 'booked_by'              => ('is' => 'rw', 'isa' => 'ObjHrAssociate',              'required' => '0');
has 'dsp_trips_loads'        => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad',        'required' => '0');
has 'job'                    => ('is' => 'rw', 'isa' => 'ObjFinJob',                   'required' => '0');
has 'dsp_loads_required_equipments' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsRequiredEquipment', 'required' => '0');
has 'created_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoad');

1;
