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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'AddrId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'Country' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => 'USA');
has 'GpsLat'  => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');
has 'GpsLng'  => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');
has 'Notes'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Street2' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => '');
has 'Street3' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => '');

# relations
has 'hr_residences'           => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',          'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');
has 'biz_branches'            => ('is' => 'rw', 'isa' => 'ArrayObjBizBranch',            'coerce' => '1', 'required' => '0');
has 'fin_billing_infos'       => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingInfo',       'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CntAddress');

1;
