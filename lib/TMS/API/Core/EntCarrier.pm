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

has 'AddedToFMCSA'         => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'AgreedBy'             => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'AgreementDate'        => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'AgreementFile'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CarrierId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'CarrierRepAgreedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CrType'               => ('is' => 'rw', 'isa' => 'set_CrType',    'coerce' => '1', 'required' => '0');
has 'DOT'                  => ('is' => 'rw', 'isa' => 'DOTnum',        'coerce' => '1', 'required' => '0');
has 'MC'                   => ('is' => 'rw', 'isa' => 'MCnum',         'coerce' => '1', 'required' => '0');
has 'McCertificatePhoto'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'OIC_STATE'            => ('is' => 'rw', 'isa' => 'VarChar2',      'coerce' => '1', 'required' => '0');
has 'RateConfEmailAddress' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'SCAC'                 => ('is' => 'rw', 'isa' => 'SCAC',          'coerce' => '1', 'required' => '0');

# relations depends on
has 'agreed_by'             => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'agreement_file'        => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');
has 'carrier'               => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'carrier_rep_agreed_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'mc_certificate_photo'  => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_permit_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccount', 'coerce' => '1', 'required' => '0');
has 'crr_statistics'      => ('is' => 'rw', 'isa' => 'ArrayObjCrrStatistic',     'coerce' => '1', 'required' => '0');
has 'ent_owner_operators' => ('is' => 'rw', 'isa' => 'ArrayObjEntOwnerOperator', 'coerce' => '1', 'required' => '0');
has 'inv_vehicles'        => ('is' => 'rw', 'isa' => 'ArrayObjInvVehicle',       'coerce' => '1', 'required' => '0');
has 'msg_ent_carriers'    => ('is' => 'rw', 'isa' => 'ArrayObjMsgEntCarrier',    'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntCarrier');

1;
