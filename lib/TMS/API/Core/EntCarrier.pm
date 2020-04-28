package TMS::API::Core::EntCarrier;

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

has 'AddedToFMCSA'              => ('is' => 'rw', 'isa' => 'DATETIME',              'coerce' => '1', 'required' => '0');
has 'CargoCarried'              => ('is' => 'rw', 'isa' => 'enum_CargoCarried',     'coerce' => '1', 'required' => '0');
has 'CarrierId'                 => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',         'coerce' => '1', 'required' => '0');
has 'CarrierOperation'          => ('is' => 'rw', 'isa' => 'enum_CarrierOperation', 'coerce' => '1', 'required' => '0');
has 'CrType'                    => ('is' => 'rw', 'isa' => 'enum_CrType',           'coerce' => '1', 'required' => '0');
has 'DOT'                       => ('is' => 'rw', 'isa' => 'DOTnum',                'coerce' => '1', 'required' => '0');
has 'EmployedDriversCDL'        => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'InerstateDriversLess100M'  => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'InerstateDriversOver100M'  => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'IntrastateDriversLess100M' => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'IntrastateDriversOver100M' => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'MC'                        => ('is' => 'rw', 'isa' => 'MCnum',                 'coerce' => '1', 'required' => '0');
has 'MCS150FormDate'            => ('is' => 'rw', 'isa' => 'DATETIME',              'coerce' => '1', 'required' => '0');
has 'MCS150FormMileage'         => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'MCS150FormMileageYear'     => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'McCertificatePhoto'        => ('is' => 'rw', 'isa' => 'PositiveInt',           'coerce' => '1', 'required' => '0');
has 'OIC_STATE'                 => ('is' => 'rw', 'isa' => 'VarChar2',              'coerce' => '1', 'required' => '0');
has 'OperationClassification' => ('is' => 'rw', 'isa' => 'enum_OperationClassification', 'coerce' => '1', 'required' => '0');
has 'RateConfEmailAddress'    => ('is' => 'rw', 'isa' => 'VarChar255',                   'coerce' => '1', 'required' => '0');
has 'SCAC'                    => ('is' => 'rw', 'isa' => 'SCAC',                         'coerce' => '1', 'required' => '0');
has 'TractorsOwned'           => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TractorsTermLeased'      => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TractorsTripLeased'      => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrailersOwned'           => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrailersTermLeased'      => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrailersTripLeased'      => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrucksOwned'             => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrucksTermLeased'        => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');
has 'TrucksTripLeased'        => ('is' => 'rw', 'isa' => 'PositiveInt',                  'coerce' => '1', 'required' => '0');

# relations depends on
has 'carrier'              => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'mc_certificate_photo' => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_permit_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccount', 'coerce' => '1', 'required' => '0');
has 'ent_owner_operators' => ('is' => 'rw', 'isa' => 'ArrayObjEntOwnerOperator', 'coerce' => '1', 'required' => '0');
has 'inv_vehicles'        => ('is' => 'rw', 'isa' => 'ArrayObjInvVehicle',       'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntCarrier');

1;
