package TMS::API::Core::CntAddress;

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

has 'AddrId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'AddrType' => ('is' => 'rw', 'isa' => 'set_AddrType',     'coerce' => '1', 'required' => '0');
has 'GpsLat'   => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');
has 'GpsLng'   => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');
has 'Notes'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'biz_branches'            => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',            'coerce' => '1', 'required' => '0');
has 'fin_billing_infos'       => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',       'coerce' => '1', 'required' => '0');
has 'hr_residences'           => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',          'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CntAddress');

1;
